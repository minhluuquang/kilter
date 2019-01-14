package gym

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

func (s *pgStore) FindByCategoriesAndLocation(ctx context.Context, categoryIDs []string, cityID string) ([]entities.Gym, error) {
	var gyms []entities.Gym

	if err := s.DB.Raw(`SELECT
    						*
						FROM
    						gyms
						WHERE
							gyms.city_id = ?
						AND	gyms.id IN (
        						SELECT
            						gyms_categories.gym_id
        						FROM
            						gyms_categories
        						WHERE
            						gyms_categories.category_id IN (?))`, cityID, categoryIDs).Scan(&gyms).Error; err != nil {
		return nil, err
	}

	return gyms, nil
}
