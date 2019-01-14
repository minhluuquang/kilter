package usercategory

import (
	"context"

	"github.com/minhluuquang/kilter/entities"
)

type Service interface {
	AddList(ctx context.Context, userCategories []entities.UsersCategory) error
}
