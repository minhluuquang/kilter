package root

import (
	"context"
	"testing"

	"github.com/minhluuquang/kilter/entities"
	gymMocks "github.com/minhluuquang/kilter/service/gym/mocks"
	userMocks "github.com/minhluuquang/kilter/service/user/mocks"
	userCategoryMocks "github.com/minhluuquang/kilter/service/usercategory/mocks"
	"github.com/stretchr/testify/mock"
)

func TestRoot_GetRecommend(t *testing.T) {
	ctx := context.Background()
	userService := &userMocks.Service{}
	gymService := &gymMocks.Service{}
	userCategoryService := &userCategoryMocks.Service{}

	gymList := []entities.Gym{
		entities.Gym{
			ID: "123",
		},
		entities.Gym{
			ID: "234",
		},
	}

	userService.On("FindByID", mock.Anything, mock.Anything).Return(entities.User{ID: "123"}, nil)
	userCategoryService.On("AddList", mock.Anything, mock.Anything).Return(nil)
	gymService.On("FindByCategoriesAndLocation", mock.Anything, mock.Anything, mock.Anything).Return(gymList, nil)

	type args struct {
		ctx         context.Context
		userID      string
		categoryIDs []string
	}
	tests := []struct {
		name string
		args args
		err  error
	}{
		{
			name: "missing user id",
			args: args{
				ctx:         ctx,
				userID:      "",
				categoryIDs: []string{},
			},
			err: ErrMissingUserID,
		},
		{
			name: "missing user preferences",
			args: args{
				ctx:         ctx,
				userID:      "abc",
				categoryIDs: []string{},
			},
			err: ErrMissingUserPreferences,
		},
		{
			name: "missing user preferences",
			args: args{
				ctx:         ctx,
				userID:      "abc",
				categoryIDs: []string{"p1", "p2"},
			},
			err: nil,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			r := &Root{
				GymService:          gymService,
				UserService:         userService,
				UserCategoryService: userCategoryService,
			}
			_, err := r.GetRecommend(tt.args.ctx, tt.args.userID, tt.args.categoryIDs)
			if err != tt.err {
				t.Errorf("Root.GetRecommend() got = %v, want %v", err, tt.err)
				return
			}
		})
	}
}
