// Code generated by mockery v1.0.0. DO NOT EDIT.

package mocks

import context "context"
import entities "github.com/minhluuquang/kilter/entities"
import mock "github.com/stretchr/testify/mock"

// Service is an autogenerated mock type for the Service type
type Service struct {
	mock.Mock
}

// FindByID provides a mock function with given fields: ctx, ID
func (_m *Service) FindByID(ctx context.Context, ID string) (entities.User, error) {
	ret := _m.Called(ctx, ID)

	var r0 entities.User
	if rf, ok := ret.Get(0).(func(context.Context, string) entities.User); ok {
		r0 = rf(ctx, ID)
	} else {
		r0 = ret.Get(0).(entities.User)
	}

	var r1 error
	if rf, ok := ret.Get(1).(func(context.Context, string) error); ok {
		r1 = rf(ctx, ID)
	} else {
		r1 = ret.Error(1)
	}

	return r0, r1
}
