# kilter

Usage

make init
init project at local.

make up
Starts local development server.

make test
Run all test files.

generate mocks
We use https://github.com/vektra/mockery to generate mocks for interface.
#### example query

```curl --request GET \
  --url http://localhost:3000/recommend \
  --form user_id=4d83d7df-7f9d-4d7f-9811-7cbd10770c68 \
  --form 'category_ids=[
"5252a29c-8b8e-4076-87b9-57a0836f3413"
]'```

