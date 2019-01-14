package entities

import (
	"time"

	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
)

// User represents a row from 'public.States'.
type User struct {
	ID        string    `json:"id,omitempty"` // id
	CityID    string    `json:"city_id,omitempty"`
	Name      string    `json:"name,omitempty"`       // name
	CreatedAt time.Time `json:"created_at,omitempty"` // created_at
	UpdatedAt time.Time `json:"updated_at,omitempty"` // updated_at
}

// db hook
// BeforeCreate prepare data before create data
func (p *User) BeforeCreate(scope *gorm.Scope) error {
	id, err := uuid.NewRandom()
	if err != nil {
		return err
	}
	p.ID = id.String()
	return nil
}
