package user

import (
	"context"

	"github.com/minhluuquang/kilter/entities"
)

type Service interface {
	FindByID(ctx context.Context, ID string) (entities.User, error)
}
