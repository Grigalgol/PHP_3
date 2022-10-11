CREATE DATABASE IF NOT EXISTS appDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT SELECT,UPDATE,INSERT ON appDB.* TO 'user'@'%';
FLUSH PRIVILEGES;

USE appDB;
CREATE TABLE IF NOT EXISTS users (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  login VARCHAR(20) NOT NULL,
  password VARCHAR(40) NOT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS products (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  price INTEGER,
  PRIMARY KEY (ID)
);

INSERT INTO users (login, password)
SELECT * FROM (SELECT 'grisha', '{SHA}QL0AFWMIX8NRZTKeof9cXsvbvu8=') AS tmp
WHERE NOT EXISTS (
    SELECT login FROM users WHERE login='grisha' AND password='123'
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Monopoly', 3999) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Monopoly' AND price = 3999
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'UNO', 499) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'UNO' AND price = 499
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Jenga', 999) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Jenga' AND price = 999
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Manchkin', 1299) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Manchkin' AND price = 1299
) LIMIT 1;

INSERT INTO products (name, price)
SELECT * FROM (SELECT 'Carcassonne', 2799) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM products WHERE name = 'Carcassonne' AND price = 2799
) LIMIT 1;