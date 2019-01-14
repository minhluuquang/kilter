package gym

import (
	"context"

	"github.com/minhluuquang/kilter/entities"
)

type Service interface {
	FindByCategoriesAndLocation(ctx context.Context, categoryIDs []string, cityID string) ([]entities.Gym, error)
}
