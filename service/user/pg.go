package user

import (
	"context"

	"github.com/jinzhu/gorm"
	"github.com/minhluuquang/kilter/entities"
)

type pgStore struct {
	DB *gorm.DB
}

// NewPGStore --
func NewPGStore(db *gorm.DB) Service {
	return &pgStore{DB: db}
}

func (s *pgStore) FindByID(ctx context.Context, ID string) (entities.User, error) {
	var user entities.User
	return user, s.DB.Where("id = ?", ID).First(&user).Error
}
