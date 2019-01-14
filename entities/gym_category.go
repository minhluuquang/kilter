package entities

import (
	"time"
)

// GymCategory represents a row from 'public.States'.
type GymCategory struct {
	GymID      string    `json:"gym_id,omitempty"`
	CategoryID string    `json:"category_id,omitempty"`
	CreatedAt  time.Time `json:"created_at,omitempty"` // created_at
	UpdatedAt  time.Time `json:"updated_at,omitempty"` // updated_at
}
