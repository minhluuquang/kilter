package entities

import (
	"time"

	"github.com/google/uuid"
	"github.com/jinzhu/gorm"
)

// State represents a row from 'public.States'.
type State struct {
	ID        string    `json:"id,omitempty"`         // id
	Name      string    `json:"name,omitempty"`       // name
	CreatedAt time.Time `json:"created_at,omitempty"` // created_at
	UpdatedAt time.Time `json:"updated_at,omitempty"` // updated_at

	// one to many
	Cities []City `json:"cities,omitempty"` // cities
}

// db hook
// BeforeCreate prepare data before create data
func (p *State) BeforeCreate(scope *gorm.Scope) error {
	id, err := uuid.NewRandom()
	if err != nil {
		return err
	}
	p.ID = id.String()
	return nil
}
