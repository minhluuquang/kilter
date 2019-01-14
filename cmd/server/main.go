package main

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"os"

	"github.com/go-chi/chi"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"

	"github.com/minhluuquang/kilter/db"
	"github.com/minhluuquang/kilter/root"
	"github.com/minhluuquang/kilter/service/gym"
	"github.com/minhluuquang/kilter/service/user"
	"github.com/minhluuquang/kilter/service/usercategory"
)

func main() {
	fmt.Println("Starting database")
	db, err := db.GetDB("localhost", "5432", "kilter", "kilter", "kilter", "disable")
	if err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}
	defer db.Close()

	fmt.Println("Serving")
	r := NewRoute(db)
	http.ListenAndServe(":3000", r)
}

// NewRoute --
func NewRoute(db *gorm.DB) http.Handler {
	ctx := context.Background()
	var (
		gymService          = gym.NewPGStore(db)
		userService         = user.NewPGStore(db)
		userCategoryService = usercategory.NewPGStore(db)
	)
	root := root.NewRoot(gymService, userService, userCategoryService)

	r := chi.NewRouter()
	r.Get("/recommend", func(w http.ResponseWriter, req *http.Request) {
		var categoryIDs []string
		req.ParseMultipartForm(0)
		userID := req.FormValue("user_id")
		categories := req.FormValue("category_ids")
		if categories != "" {
			if err := json.Unmarshal([]byte(categories), &categoryIDs); err != nil {
				w.WriteHeader(http.StatusInternalServerError)
				w.Write([]byte(err.Error()))
				return
			}
		}

		gymList, err := root.GetRecommend(ctx, userID, categoryIDs)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte(err.Error()))
			return
		}

		resp, err := json.Marshal(gymList)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte(err.Error()))
			return
		}

		w.WriteHeader(http.StatusOK)
		w.Write(resp)
	})
	return r
}
