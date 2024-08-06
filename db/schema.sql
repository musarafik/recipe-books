CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash BYTEA NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recipe_books (
    recipe_book_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT, 
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE recipes (
    recipe_id SERIAL PRIMARY KEY,
    recipe_book_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL UNIQUE,
    cooking_instructions TEXT NOT NULL,
    ingredients TEXT NOT NULL,
    likes INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recipe_book_id) REFERENCES recipe_books(recipe_book_id)
);