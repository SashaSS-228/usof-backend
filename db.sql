CREATE TABLE users (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	login varchar(255) UNIQUE NOT NULL,
	password varchar(255) NOT NULL,
	full_name varchar(255) NULL,
	email varchar(255) UNIQUE NOT NULL,
	profile_pic varchar(255) NULL,
	rating bigint NOT NULL DEFAULT 0,
	active boolean DEFAULT false,
    role varchar(255) NOT NULL DEFAULT 'user',
	token varchar(255) NULL
);

CREATE TABLE posts (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	author_id bigint REFERENCES users (id) ON DELETE CASCADE,
	title varchar(255) NOT NULL,
	publish_date DATE NOT NULL,
	status boolean NOT NULL,
	content text NOT NULL,
	content_picture varchar(255) NULL
);

CREATE TABLE categories (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title varchar(255) NOT NULL,
	description varchar(255) NOT NULL
);

CREATE TABLE comments (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	author_id bigint REFERENCES users (id) ON DELETE CASCADE,
	post_id bigint REFERENCES posts (id) ON DELETE CASCADE,
	publish_date timestamp NOT NULL,
	content text NOT NULL
);

CREATE TABLE like_post (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_post bigint REFERENCES posts (id) ON DELETE CASCADE,
	author_id bigint REFERENCES users (id) ON DELETE CASCADE,
	publish_date timestamp NOT NULL,
	type boolean NOT NULL
);

CREATE TABLE like_comments (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_comment bigint REFERENCES comments (id) ON DELETE CASCADE,
	author_id bigint REFERENCES users (id) ON DELETE CASCADE,
	publish_date timestamp NOT NULL,
	type BOOLEAN NOT NULL
);

-- CREATE TABLE roles (
-- 	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 	user_id bigint REFERENCES users (id) ON DELETE CASCADE,
-- 	role varchar(255) NOT NULL
-- );

CREATE TABLE post_category (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_post bigint REFERENCES posts (id) ON DELETE CASCADE,
	id_category bigint REFERENCES categories (id) ON DELETE CASCADE
);


-- create TABLE user(
--     id SERIAL PRIMARY KEY,
--     login VARCHAR(255),
--     full_name VARCHAR(255),
--     email VARCHAR(255),
--     profile_photo VARCHAR(255),
--     rating int,
--     role int
-- );

-- create TABLE user(
--     id SERIAL PRIMARY KEY,
--     author VARCHAR(255),
--     title VARCHAR(255),
--     publish_date VARCHAR(255),
--     status VARCHAR(255),
--     content VARCHAR(255),
--     categories VARCHAR(255)
-- );