package root

import (
	"context"
	"errors"
	"sort"

	"github.com/minhluuquang/kilter/entities"
	"github.com/minhluuquang/kilter/service/gym"
	"github.com/minhluuquang/kilter/service/user"
	"github.com/minhluuquang/kilter/service/usercategory"
)

// Root --
type Root struct {
	GymService          gym.Service
	UserService         user.Service
	UserCategoryService usercategory.Service
}

// NewRoot --
func NewRoot(
	gymService gym.Service,
	userService user.Service,
	userCategoryService usercategory.Service,
) Root {
	return Root{
		GymService:          gymService,
		UserService:         userService,
		UserCategoryService: userCategoryService,
	}
}

var (
	ErrMissingUserID          = errors.New("missing user id")
	ErrMissingUserPreferences = errors.New("missing user preferences")
)

// GetRecommend --
func (r *Root) GetRecommend(ctx context.Context, userID string, categoryIDs []string) ([]entities.Gym, error) {
	if userID == "" {
		return nil, ErrMissingUserID
	}

	if len(categoryIDs) == 0 {
		return nil, ErrMissingUserPreferences
	}

	// get user
	u, err := r.UserService.FindByID(ctx, userID)
	if err != nil {
		return nil, err
	}
	if u.ID == "" {
		return nil, errors.New("User not found")
	}

	// add user preferences
	var userCategories = []entities.UsersCategory{}
	for _, categoryID := range categoryIDs {
		v := entities.UsersCategory{UserID: userID, CategoryID: categoryID}
		userCategories = append(userCategories, v)
	}
	if err := r.UserCategoryService.AddList(ctx, userCategories); err != nil {
		return nil, err
	}

	// get list gym
	gymList, err := r.GymService.FindByCategoriesAndLocation(ctx, categoryIDs, u.CityID)
	if err != nil {
		return nil, err
	}

	// count the overlap
	for _, g := range gymList {
		for _, gc := range g.Categories {
			for _, id := range categoryIDs {
				if gc.ID == id {
					g.OverlapCategories++
				}
			}
		}
	}

	// sort the result
	sort.Slice(gymList, func(i, j int) bool {
		return gymList[i].OverlapCategories > gymList[j].OverlapCategories
	})

	return gymList, err
}
