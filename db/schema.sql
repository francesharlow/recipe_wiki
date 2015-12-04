DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS categories;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  password_digest VARCHAR,
  username VARCHAR(25),
  location VARCHAR(100),
  avatar_img_url TEXT
);

CREATE TABLE articles (
  id INTEGER PRIMARY KEY,
  title VARCHAR,
  ingredients TEXT,
  directions TEXT,
  img_url TEXT,
  created_at DATETIME,
  author_id INTEGER
  -- latest_edited_at DATETIME,
  -- latest_editor_id INTEGER REFERENCES users(id)
);

-- CREATE TABLE categories (

-- );