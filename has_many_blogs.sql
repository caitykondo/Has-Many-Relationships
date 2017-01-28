-- \c postgres

DROP USER IF EXISTS "has_many_user";
DROP DATABASE IF EXISTS "has_many_blogs";

CREATE USER "has_many_user" WITH ENCRYPTED PASSWORD 'PassMyWord';
CREATE DATABASE "has_many_blogs" WITH OWNER "has_many_user";


-- psql -U has_many_user -W has_many_blogs

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE users (
  id serial PRIMARY KEY,
  username varchar(90),
  first_name varchar(90),
  last_name varchar(90),
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);

CREATE TABLE posts (
  id serial PRIMARY KEY,
  title varchar(180),
  url varchar(510),
  content text,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  users_id serial REFERENCES users (id)
);

CREATE TABLE comments (
  id serial PRIMARY KEY,
  body varchar(510),
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  posts_id serial REFERENCES posts (id),
  users_id serial REFERENCES users (id)
);

\i scripts/blog_data.sql;

