DB_URL=mysql://root:password@tcp(localhost:3306)/ecomm

## help: print this help message
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## new_migration: init sql migration file with name as parameter
new_migration:
	migrate create -ext sql -dir db/migrations -seq $(name)

## migrateup: migrate all up schema sql
migrateup:
	migrate -path db/migrations -database "$(DB_URL)" -verbose up

## migrateup1: migrate up schema sql by 1
migrateup1:
	migrate -path db/migrations -database "$(DB_URL)" -verbose up 1

## migratedown: migrate all down schema sql
migratedown:
	migrate -path db/migrations -database "$(DB_URL)" -verbose down

## migratedown1: migrate down schema sql by 1
migratedown1:
	migrate -path db/migrations -database "$(DB_URL)" -verbose down 1


.PHONY: help new_migration migrateup migrateup1 migratedown migratedown1