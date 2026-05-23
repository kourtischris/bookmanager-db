CREATE DATABASE IF NOT EXISTS `bookmanagerdb`;

USE `bookmanagerdb`;

CREATE TABLE authors (
  id          BIGINT       NOT NULL AUTO_INCREMENT,
  name        VARCHAR(255) NOT NULL,
  nationality VARCHAR(255) DEFAULT NULL,
  birth_date  DATE         DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE books (
  id               BIGINT       NOT NULL AUTO_INCREMENT,
  title            VARCHAR(255) NOT NULL,
  isbn             VARCHAR(255) DEFAULT NULL,
  category         VARCHAR(255) DEFAULT NULL,
  publication_year INT          DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE books_authors (
  id        BIGINT NOT NULL AUTO_INCREMENT,
  book_id   BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  PRIMARY KEY (id),
  KEY idx_book_id   (book_id),
  KEY idx_author_id (author_id),
  CONSTRAINT fk_ba_book
    FOREIGN KEY (book_id)   REFERENCES books(id)   ON DELETE CASCADE,
  CONSTRAINT fk_ba_author
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE
);

INSERT INTO authors (name, nationality, birth_date) 
VALUES
  ('Νίκος Καζαντζάκης', 'Ελληνική', '1883-02-18'),
  ('Κωστής Παλαμάς',    'Ελληνική', '1859-01-13');

INSERT INTO books (title, isbn, category, publication_year) 
VALUES
  ('Ζορμπάς',                   '978-960-02-1001-1', 'Μυθιστόρημα', 1946),
  ('Ο Χριστός Ξανασταυρώνεται', '978-960-02-1002-2', 'Μυθιστόρημα', 1948);

INSERT INTO books_authors (book_id, author_id) 
VALUES
  (1, 1),
  (2, 1);