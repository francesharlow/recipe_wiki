DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS edits;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS articles_categories;

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
  created_on DATETIME,
  author_id INTEGER
);

CREATE TABLE edits (
  id INTEGER PRIMARY KEY,
  article_id INTEGER,
  editor_id INTEGER,
  edited_at DATETIME
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE articles_categories (
  article_id INTEGER,
  category_id INTEGER
);