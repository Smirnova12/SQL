CREATE DATABASE IF NOT EXISTS employees;
USE employees; 

CREATE TABLE IF NOT EXISTS workers (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 salary DECIMAL(6,3) NOT NULL 
 );

INSERT INTO workers (id, first_name, last_name, salary) VALUES (null, 'Ivan', 'Popov', 20.560);
INSERT INTO workers (id, first_name, last_name, salary) VALUES (null, 'Igor', 'Smirnov', 40.000);
INSERT INTO workers (id, first_name, last_name, salary) VALUES (null, 'Vadim', 'Ivanov', 100.000);
INSERT INTO workers (id, first_name, last_name, salary) VALUES (null, 'Alexander', 'Barinov', 50.000);
INSERT INTO workers (id, first_name, last_name, salary) VALUES (null, 'Roman', 'Petrov', 45.000);

CREATE TABLE IF NOT EXISTS posts (
id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
post_name VARCHAR(20)
);

INSERT INTO posts (id, post_name) VALUES (null, 'manager');
INSERT INTO posts (id, post_name) VALUES (null, 'accountant');
INSERT INTO posts (id, post_name) VALUES (null, 'director');
INSERT INTO posts (id, post_name) VALUES (null, 'designer');

ALTER TABLE workers ADD post_id INTEGER NOT NULL;

UPDATE workers SET post_id=1 WHERE id IN (2,5);
UPDATE workers SET post_id=2 WHERE id=1;
UPDATE workers SET post_id=3 WHERE id=3;
UPDATE workers SET post_id=4 WHERE id=4;

SELECT worker.first_name, worker.last_name, post.post_name
FROM workers worker
INNER JOIN posts post ON worker.post_id=post.id;

SELECT first_name, last_name, salary
FROM employees.workers
WHERE salary<30.000;

SELECT first_name, last_name, salary
FROM employees.workers
WHERE salary<41.000
AND post_id=1;