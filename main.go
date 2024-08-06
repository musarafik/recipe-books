package main

import (
	"context"
	"log"
	db "recipe_books/db/sqlc"

	"github.com/jackc/pgx/v5"
)

func main() {
	err := run()
	if err != nil {
		log.Fatal(err)
	}
}

func run() error {
	ctx := context.Background()

	conn, err := pgx.Connect(ctx, "user=musarafik dbname=recipe_books sslmode=verify-full")

	if err != nil {
		return err
	}

	defer conn.Close(ctx)

	queries := db.New(conn)

	users, err := queries.ListUsers(ctx)
	if err != nil {
		return err
	}
	log.Println(users)

	return nil
}
