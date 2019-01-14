FROM golang:1.10
RUN mkdir -p /go/src/github.com/minhluuquang/kilter
WORKDIR /go/src/github.com/minhluuquang/kilter
COPY . .
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o server cmd/server/*.go

FROM alpine:3.7
RUN apk --no-cache add ca-certificates
WORKDIR /
EXPOSE 9000
CMD ["/server"]
