package usercategory

import (
	"context"

	"github.com/jinzhu/gorm"
	"github.com/lib/pq"
	"github.com/minhluuquang/kilter/entities"
)

type pgStore struct {
	DB *gorm.DB
}

// NewPGStore --
func NewPGStore(db *gorm.DB) Service {
	return &pgStore{DB: db}
}

func (s *pgStore) AddList(ctx context.Context, userCategories []entities.UsersCategory) error {
	tx := s.DB.Begin()
	for _, v := range userCategories {
		if err := s.DB.Create(&v).Error; err != nil {
			pgErr := err.(*pq.Error)
			if pgErr.Code == "23505" { // unique_violation error
				continue
			}
			tx.Rollback()
			return err
		}
	}
	tx.Commit()
	return nil
}
