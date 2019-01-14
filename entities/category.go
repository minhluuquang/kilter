package entities

import (
	"time"

	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
)

// Category represents a row from 'public.States'.
type Category struct {
	ID        string    `json:"id,omitempty"`         // id
	Name      string    `json:"name,omitempty"`       // name
	CreatedAt time.Time `json:"created_at,omitempty"` // created_at
	UpdatedAt time.Time `json:"updated_at,omitempty"` // updated_at
}

// db hook
// BeforeCreate prepare data before create data
func (p *Category) BeforeCreate(scope *gorm.Scope) error {
	id, err := uuid.NewRandom()
	if err != nil {
		return err
	}
	p.ID = id.String()
	return nil
}
