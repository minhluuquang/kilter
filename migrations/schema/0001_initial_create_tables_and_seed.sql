
-- +goose Up
CREATE TABLE IF NOT EXISTS states (
        id varchar(50) PRIMARY KEY NOT NULL,
        name varchar(512) NOT NULL,
        created_at timestamp DEFAULT now() NOT NULL,
        updated_at timestamp DEFAULT now() NOT NULL,
        deleted_at timestamp
);

CREATE TABLE IF NOT EXISTS cities (
        id varchar(50) PRIMARY KEY NOT NULL,
        state_id VARCHAR(50) REFERENCES states (id) NOT NULL,
        name varchar(512) NOT NULL,
        created_at timestamp DEFAULT now() NOT NULL,
        updated_at timestamp DEFAULT now() NOT NULL,
        deleted_at timestamp
);

CREATE TABLE IF NOT EXISTS categories (
        id varchar(50) PRIMARY KEY NOT NULL,
        name varchar(512) NOT NULL,
        created_at timestamp DEFAULT now() NOT NULL,
        updated_at timestamp DEFAULT now() NOT NULL,
        deleted_at timestamp
);

CREATE TABLE IF NOT EXISTS gyms (
        id varchar(50) PRIMARY KEY NOT NULL,
        city_id varchar(50) REFERENCES cities (id) NOT NULL,
        name varchar(512) NOT NULL,
        created_at timestamp DEFAULT now() NOT NULL,
        updated_at timestamp DEFAULT now() NOT NULL,
        deleted_at timestamp
);

CREATE TABLE IF NOT EXISTS users (
        id varchar(50) PRIMARY KEY NOT NULL,
        name varchar(512) NOT NULL,
        city_id varchar(50) REFERENCES cities(id) NOT NULL,
        created_at timestamp DEFAULT now() NOT NULL,
        updated_at timestamp DEFAULT now() NOT NULL,
        deleted_at timestamp
);

CREATE TABLE IF NOT EXISTS gyms_categories
(
    gym_id VARCHAR(50) REFERENCES gyms (id) NOT NULL,
    category_id VARCHAR(50) REFERENCES categories (id) NOT NULL,
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL,
    deleted_at timestamp,
    CONSTRAINT gym_category_pkey PRIMARY KEY (gym_id, category_id)
);

CREATE TABLE IF NOT EXISTS users_categories
(
    user_id VARCHAR(50) REFERENCES users (id) NOT NULL,
    category_id VARCHAR(50) REFERENCES categories (id) NOT NULL,
    created_at timestamp DEFAULT now() NOT NULL,
    updated_at timestamp DEFAULT now() NOT NULL,
    deleted_at timestamp,
    CONSTRAINT user_category_pkey PRIMARY KEY (user_id, category_id)
);

-- +goose Down
DROP TABLE gyms CASCADE;
DROP TABLE users CASCADE;
DROP TABLE categories CASCADE;
DROP TABLE cities CASCADE;
DROP TABLE states CASCADE;
DROP TABLE gyms_categories CASCADE;
DROP TABLE users_categories CASCADE;
