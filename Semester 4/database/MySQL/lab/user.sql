use university;

drop table users;
CREATE TABLE users (
	ID INT AUTO_INCREMENT UNIQUE,
    Username VARCHAR(128) NOT NULL UNIQUE,
    Password VARCHAR(256) NOT NULL,
    Email VARCHAR(128) NOT NULL UNIQUE,
    PRIMARY KEY (Email)
);

INSERT INTO users VALUE ("Sharafat Karim", "1234", "sharafat@duck.com");
SELECT * FROM users;