.PHONY: gql build dev

SRC_PATH=$(GOPATH)/src/github.com/minhluuquang/kilter

POSTGRES_CONTAINER?=kilter_db

build-alpine:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server cmd/server/*.go

build:
	go build -o server cmd/server/*.go

test:
	go test ./...

dev:
	@DB_HOST=localhost go run cmd/server/main.go

remove-infras:
	docker-compose stop; docker-compose  rm -f

init: remove-infras
	docker-compose  up -d kilter_db db-test
	@echo "Waiting for database connection..."
	@while ! docker exec $(POSTGRES_CONTAINER) pg_isready -h localhost -p 5432 > /dev/null; do \
		sleep 1; \
	done
	make migrate-local
	make seed-db-local

cleandb:
	docker exec -t $(POSTGRES_CONTAINER) sh -c "PGPASSWORD=kilter psql -U kilter -c 'DROP schema if exists public CASCADE; CREATE SCHEMA public;'"

seed-db-local:
	@docker cp  migrations/seed/seed.sql  $(POSTGRES_CONTAINER):/seed.sql
	@docker exec -t $(POSTGRES_CONTAINER) sh -c "PGPASSWORD=kilter psql -U kilter -d kilter -f /seed.sql"

up:
	docker-compose  stop kilter
	docker-compose  rm -f kilter
	docker-compose  up -d --build --force-recreate kilter

migrate-local:
	goose -dir migrations/schema postgres "host=127.0.0.1 port=5432 user=kilter password=kilter dbname=kilter sslmode=disable" up
