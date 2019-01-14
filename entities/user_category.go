package entities

import (
	"time"
)

// UserCategory represents a row from 'public.States'.
type UsersCategory struct {
	UserID     string    `json:"user_id,omitempty"`
	CategoryID string    `json:"category_id,omitempty"`
	CreatedAt  time.Time `json:"created_at,omitempty"` // created_at
	UpdatedAt  time.Time `json:"updated_at,omitempty"` // updated_at
}
