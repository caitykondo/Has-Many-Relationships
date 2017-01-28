CREATE USER "has_many_user" WITH ENCRYPTED PASSWORD 'PassMyWord';
CREATE DATABASE "has_many_blogs" WITH OWNER "has_many_user";

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE users (
  id serial PRIMARY KEY,
  username varchar(90),
  first_name varchar(90),
  last_name varchar(90),
  created_at timestamp with time zone,
  updated_at timestamp with time zone,

);

CREATE TABLE posts (
  id serial PRIMARY KEY,
  title varchar(180),
  url varchar(510),
  content text,
  created_at timestamp with time zone,
  updated_at timestamp with time zone
);

CREATE TABLE comments (
  id serial PRIMARY KEY,
  body varchar(510),
  created_at timestamp with time zone,
  updated_at timestamp with time zone
);

ALTER TABLE users ALTER COLUMN created_at SET DEFAULT now();
ALTER TABLE users ALTER COLUMN updated_at SET DEFAULT now();
ALTER TABLE posts ALTER COLUMN created_at SET DEFAULT now();
ALTER TABLE posts ALTER COLUMN updated_at SET DEFAULT now();
ALTER TABLE comments ALTER COLUMN created_at SET DEFAULT now();
ALTER TABLE comments ALTER COLUMN updated_at SET DEFAULT now();

ALTER TABLE posts ADD COLUMN comments integer REFERENCES comments(posts);
ALTER TABLE posts ADD COLUMN user_id integer REFERENCES users(id);
ALTER TABLE users ADD COLUMN posts integer REFERENCES posts(user_id);
ALTER TABLE users ADD COLUMN comments integer REFERENCES comments(user_id);
ALTER TABLE comments ADD COLUMN user_id integer;
ALTER TABLE comments ADD COLUMN posts integer;

-- SELECT users.*, posts.user_id
-- FROM users
-- INNER JOIN posts.user_id = users.posts;