CREATE DATABASE IF NOT EXISTS sql_judge;
USE sql_judge;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    institution VARCHAR(100),
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user',
    is_verified BOOLEAN DEFAULT FALSE,
    verification_code VARCHAR(255),
    verification_code_expiry DATETIME,
    reset_token VARCHAR(255),
    reset_token_expiry DATETIME,
    profile_picture VARCHAR(255),
    bio TEXT,
    gendar VARCHAR(10),
    date_of_birth DATE,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    website VARCHAR(255),
    github VARCHAR(255),
    twitter VARCHAR(255),
    linkedin VARCHAR(255),
    facebook VARCHAR(255),
    telegram VARCHAR(255),
    last_login DATETIME,
    total_solved INT DEFAULT 0,
    total_submissions INT DEFAULT 0,
    total_contributions INT DEFAULT 0,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESC users;
select * from users;

CREATE TABLE feedback (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    feedback TEXT NOT NULL,
    website VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

select * from feedback;
SELECT * FROM users WHERE username = 'sharafat1';

CREATE TABLE blogs (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    author_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL, -- HTML content
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    is_published BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (author_id) REFERENCES users(ID)
);

select * from blogs;

CREATE TABLE blog_comments (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    blog_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (blog_id) REFERENCES blogs(ID),
    FOREIGN KEY (user_id) REFERENCES users(ID)
);

DROP TABLE blog_reactions;
CREATE TABLE blog_reactions (
    blog_id INT,
    user_id INT,
    reaction ENUM('like', 'dislike') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (blog_id, user_id),
    FOREIGN KEY (blog_id) REFERENCES blogs(ID),
    FOREIGN KEY (user_id) REFERENCES users(ID)
);

select * from blog_reactions;
desc blog_reactions;
SELECT reaction, COUNT(*) as count FROM blog_reactions WHERE blog_id = 2 GROUP BY reaction;