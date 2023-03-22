-- this is like a scratchpad - you need to enter the code in the terminal

-- create a new database
create database swimming_coach; -- DB name

-- switch our active DB to what we have just created
use swimming_coach;

-- to see all tables in the current DBs. if none created --> empty set
show tables;

-- `create table`. the engine = innodb is for foreign keys. name is key insensitive
-- auto_increment: id+1. serial +1 +2...
create table parents (
    parent_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    contact_number VARCHAR(8)
) engine = innodb;

--
DESCRIBE parents;
-- data type (foreign key) === data type (primary key)

CREATE TABLE students (
    student_id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    swimming_level TINYINT,
    date_of_birth DATETIME,
    -- only creating the parent_id column at this point.
    -- still have to set the foreign key at a second step
    parent_id INT UNSIGHED NOT NULL,
) engine = innodb;

-- now we set the FK such that the parent_id column
-- in the students table must refer to a valid row in the parents table

-- name of constraint will show up when there's an error, so yk where's the error
ALTER TABLE students ADD CONSTRAINT fk_students_parents
FOREIGN KEY (parent_id) REFERENCES parents(parent_id)

-- insert some parents
-- parent id don't need to be put in parenthesis, because we are using auto_increment
INSERT INTO parents (name, contact_number) VALUES ("Tan Ah Kow", "12345678");

-- the following works coz contact_number column in parents table is nullable
INSERT INTO parents (name) VALUES ("Phua Chu Kang")

-- to see all the rows in a table
SELECT * FROM parents;

-- insert a new student (no need id here coz auto increment! last no. is the parent_id 
-- and only works when the parent_id exists)
INSERT INTO STUDENTS (name, swimming_level, date_of_birth, parent_id)
VALUES ("Tan Ah Boy", 0, "2022-01-03", 1);

-- must delete the child first then delete the parent

ALTER TABLE parents MODIFY COLUMN contact_number VARCHAR(11) NOT NULL;

-- delete the table
DROP TABLE asd;