postgres:
	docker run --name postgres14 -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14-alpine

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres14 dropdb simple_bank

migrate-up:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/simple_bank?sslmode=disable" up

migrate-down:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/simple_bank?sslmode=disable" down

.PHONY: postgres createdb dropdb migrate-up migrate-down
