#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
// #set text(font: "Ubuntu Nerd Font")
#set par(justify: true)
#set heading(numbering: "1.")

// --------------------------
// Title page
// --------------------------

#align(left)[
  #image("PSTU.png", width: 20%, height: auto, alt: "PSTU")
  #text(16pt)[
    *Patuakhali Science and Technology University* \
  ]
  #text(14pt)[
    Faculty of Computer Science and Engineering
  ]

  #line(length: 100%)
  #align(
    left,
    text(18pt)[
      *CCE 224 :: Database System Sessional*
    ],
  )
  #align(
    left,
    text(14pt)[
      *Sessional Project Report*
    ],
  )
  #line(length: 100%)
]

#align(bottom)[
  #line(length: 100%)
  *Project Title : SQL Judge* \
  Submission Date : Sat 14, June 2025 \
  #line(length: 100%)
]

#align(bottom)[
  // Submitted to,
  #rect(width: 100%)[
    #text(size: 14pt)[
      *Submitted to,* \
    ]
    #parbreak()
    *Prof. Dr. Md Samsuzzaman* \
    Professor, \
    Department of Computer and Communication Engineering, \
    Patuakhali Science and Technology University.
  ]
]

#align(bottom)[

  // Submitted by,
  #rect(width: 100%)[
    #text(size: 14pt)[
      *Submitted by,* \
    ]

    *Md. Sharafat Karim* \
    ID : 2102024, \
    Reg: 10151 \
  ]
]

#pagebreak()

#outline()
#pagebreak()

// --------------------------
// Contents
// --------------------------

#align(center)[
  #text(size: 20pt, weight: "bold")[SQL Judge]
]

= Introduction

An SQL learning platform that allows users to learn and practice SQL queries. It it provides a set of features including user registration, problem submission, and a leaderboard. And last but not least, it has built in Blog and chatsheet.

#rect(width: 100%)[
    Live URL #h(0.61cm) : #link("http://sql-judge.sharafat.xyz/") \
    GitHub Repo : #link("https://github.com/SharafatKarim/SQL-Judge")
  ]

= Objective

- To create a platform that allows users to learn and practice SQL queries in a fun and interactive way.
- To provide a set of features that will help users to learn and practice SQL queries.
- To create a platform that will help mentors and teachers to help spreading the knowledge of SQL and database management.
- To enable users to share their learningings through blogs and discussions.
- A quick way to find chatsheet and resources related to SQL and database management.


= Technology

#table(
  columns: (auto, auto),
  table.header(
    [*Layer*],
    [*Technology*],
  ),

  [Frontend], [HTML, CSS & JavaScript],
  [Backend], [PHP],
  [Database], [MySQL],
  [Authentication], [Session storage],
  [Hosting], [Localhost, infinityfree],
  [Version control], [Git],
  [CI/ CD], [GitHub],
)

= Database Characteristics

- *CRUD Operations* (Create, Read, Update, Delete) are used in the database in a centralized manner among different frontend instances.
- *Data Integrity* is Enforced through foreign keys and constraints. Also a DDL file is provided to create the database and tables alongside grapical references.
- *Normalization* is applied to reduce redundancy and save disk memory.
- *Auth Security*: Implemented through user authentication and authorization. Mainly session storage is used for user authentication.
- Php *PDO driver* is used for database interactions, so that it can also connect to other databases like PostgreSQL, SQLite, etc.
- *Parameterized arguments* were used to prevent SQL injection attacks and form validations.
- *Database triggers* were used to automatically update total_contribution, total_submission and total_solved per user.
- *Environment variables* (`.env`) are used to store sensitive information like database credentials, so that they are not hardcoded in the codebase. Also, a *`.gitignore`* file is used so that database credentials and other sensitive information are not pushed to the public GitHub repository.

== Schema Diagram

#image("schema.png", width: 100%, height: auto, alt: "E-R Diagram")

== E-R Diagram

=== Without attributes
#image("diagram-2.svg", width: 100%, height: auto, alt: "E-R Diagram")

=== With all attributes
#image("diagram.svg", width: 100%, height: auto, alt: "E-R Diagram")

== Gantt Chart 
#image("gantt.png", width: 100%, height: auto, alt: "Gantt Chart")

#pagebreak()
= Database Implementation

== DDL

Data definition language statements,

=== Database Creation
```sql
CREATE DATABASE IF NOT EXISTS sql_judge;
USE sql_judge;
```
=== Table Creation
==== Users Table
```sql
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
    gender VARCHAR(10),
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
```
==== Feedback Table
```sql
DROP TABLE IF EXISTS feedback;
CREATE TABLE feedback (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    feedback TEXT NOT NULL,
    website VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(ID)
);
```
==== Blogs and Comments
```sql
DROP TABLE IF EXISTS blogs;
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

DROP TABLE IF EXISTS blog_comments;
CREATE TABLE blog_comments (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    blog_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (blog_id) REFERENCES blogs(ID),
    FOREIGN KEY (user_id) REFERENCES users(ID)
);

DROP TABLE IF EXISTS blog_reactions;
CREATE TABLE blog_reactions (
    blog_id INT,
    user_id INT,
    reaction ENUM('like', 'dislike') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (blog_id, user_id),
    FOREIGN KEY (blog_id) REFERENCES blogs(ID),
    FOREIGN KEY (user_id) REFERENCES users(ID)
);
```

==== Newsletters Table
```sql
DROP TABLE IF EXISTS newsletters;
CREATE TABLE newsletters (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    subscribed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```
==== Contests, Problems
```sql
DROP TABLE IF EXISTS contests;
CREATE TABLE contests (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    is_public BOOLEAN DEFAULT TRUE,
    created_by INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(ID)
);

DROP TABLE IF EXISTS contest_registrations;
CREATE TABLE contest_registrations (
    user_id INT NOT NULL,
    contest_id INT NOT NULL,
    registered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, contest_id),
    FOREIGN KEY (user_id) REFERENCES users(ID),
    FOREIGN KEY (contest_id) REFERENCES contests(ID)
);

DROP TABLE IF EXISTS problems;
CREATE TABLE problems (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    contest_id INT,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    difficulty ENUM('easy', 'medium', 'hard') DEFAULT 'medium',
    time_limit INT DEFAULT 2, -- in seconds
    memory_limit INT DEFAULT 256, -- in MB
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contest_id) REFERENCES contests(ID)
);

DROP TABLE IF EXISTS test_cases;
CREATE TABLE test_cases (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    problem_id INT NOT NULL,
    input TEXT,
    expected_output TEXT,
    is_hidden BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (problem_id) REFERENCES problems(ID)
);
```
==== Submissions and User Scores
```sql
DROP TABLE IF EXISTS submissions;
CREATE TABLE submissions (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    problem_id INT NOT NULL,
    code TEXT NOT NULL,
    status ENUM('pending', 'running', 'accepted', 'wrong_answer', 'time_limit_exceeded', 'runtime_error') DEFAULT 'pending',
    execution_time FLOAT,
    memory_used INT,
    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(ID),
    FOREIGN KEY (problem_id) REFERENCES problems(ID)
);

DROP TABLE IF EXISTS user_scores;
CREATE TABLE user_scores (
    user_id INT NOT NULL,
    contest_id INT NOT NULL,
    problem_id INT NOT NULL,
    PRIMARY KEY (user_id, contest_id, problem_id),
    FOREIGN KEY (user_id) REFERENCES users(ID),
    FOREIGN KEY (contest_id) REFERENCES contests(ID),
    FOREIGN KEY (problem_id) REFERENCES problems(ID)
);
```

=== Triggers

```sql
-- A trigger to increment total_contributions for the author when a new blog is published
DELIMITER $$
CREATE TRIGGER increment_contributions_after_insert
AFTER INSERT ON blogs
FOR EACH ROW
BEGIN
    IF NEW.is_published = TRUE THEN
        UPDATE users
        SET total_contributions = total_contributions + 5
        WHERE ID = NEW.author_id;
    END IF;
END$$
DELIMITER ;

-- Trigger to decrement total_contributions when a blog is updated from published to draft
DELIMITER $$
CREATE TRIGGER decrement_contributions_after_update_to_draft
AFTER UPDATE ON blogs
FOR EACH ROW
BEGIN
    IF OLD.is_published = TRUE AND NEW.is_published = FALSE THEN
        UPDATE users
        SET total_contributions = total_contributions - 5
        WHERE ID = NEW.author_id;
    END IF;
END$$
DELIMITER ;

-- Trigger to increment total_contributions when a blog is updated from draft to published
DELIMITER $$
CREATE TRIGGER increment_contributions_after_update_to_publish
AFTER UPDATE ON blogs
FOR EACH ROW
BEGIN
    IF OLD.is_published = FALSE AND NEW.is_published = TRUE THEN
        UPDATE users
        SET total_contributions = total_contributions + 5
        WHERE ID = NEW.author_id;
    END IF;
END$$
DELIMITER ;

-- Trigger to increment total_contributions by 1 when a new comment is added
DELIMITER $$
CREATE TRIGGER increment_contributions_after_comment
AFTER INSERT ON blog_comments
FOR EACH ROW
BEGIN
    UPDATE users
    SET total_contributions = total_contributions + 1
    WHERE ID = NEW.user_id;
END$$
DELIMITER ;

-- Trigger to increment total_submissions by 1 when a new submission is added
DELIMITER $$
CREATE TRIGGER increment_total_submissions_after_insert
AFTER INSERT ON submissions
FOR EACH ROW
BEGIN
    UPDATE users
    SET total_submissions = total_submissions + 1
    WHERE ID = NEW.user_id;
END$$
DELIMITER ;

-- Trigger to increment total_solved by 1 when a new user_scores entry is added
DELIMITER $$
CREATE TRIGGER increment_total_solved_after_user_score_insert
AFTER INSERT ON user_scores
FOR EACH ROW
BEGIN
    UPDATE users
    SET total_solved = total_solved + 1
    WHERE ID = NEW.user_id;
END$$
DELIMITER ;
```

=== Views
```sql
-- View to get the top 5 users based on total_solved
CREATE VIEW top_rated_5 as
SELECT username, first_name, last_name, total_solved
FROM users
ORDER BY total_solved DESC LIMIT 5;

-- View to get the top 5 users based on total_contributions
CREATE VIEW top_contributors_5 as
SELECT username, first_name, last_name, total_contributions
FROM users
ORDER BY total_contributions DESC LIMIT 5;
```

== DML (SQL Queries)

=== Authentication

+ *User Registration*
  ```sql
  INSERT INTO users (username, email, first_name, last_name, password, website, bio) VALUES (:username, :email, :first_name, :last_name, :password, :website, :bio)
  ```
  #image("ss/1.png", width: 100%, height: auto, alt: "PSTU")

+ *User Login*
  ```sql
SELECT id, username, password FROM users WHERE username = :username"
```
  #image("ss/2.png", width: 100%, height: auto, alt: "PSTU")

+ *Check if user already exists*
  ```sql
  SELECT id FROM users WHERE username = :username"
  ```
  #image("ss/3.png", width: 100%, height: auto, alt: "PSTU")

=== User Profile

+ *Get user profile*
  ```sql
  SELECT * FROM users WHERE username = :username

    # ID, username, email, first_name, last_name, country, institution, role, is_verified, verification_code, verification_code_expiry, reset_token, reset_token_expiry, profile_picture, bio, gendar, date_of_birth, phone_number, address, website, github, twitter, linkedin, facebook, telegram, last_login, total_solved, total_submissions, total_contributions, password, created_at
    1, sharafat, sharafat@duck.com, Sharafat, Karim, Bangladesh, PSTU, user, 0, , , , , , There&#039;s no end to EXPLORATION!, Male, 2002-11-08, 01953546089, Patuakhali, https://sharafat.pages.dev, https://github.com/SharafatKarim, , , , https://t.me/SharafatKarim, , 0, 1, 32, $2y$12$CceqDu/Ww9T44k2SdgT5DuzeeyR2ZanlSD8rvZlA/MXcGd3iC2Gbe, 2025-04-08 06:44:18
  ```
  #image("ss/4.png", width: 100%, height: auto, alt: "PSTU")

+ *Update user profile*
  ```sql
  UPDATE users SET
            first_name = :first_name,
            last_name = :last_name,
            email = :email,
            country = :country,
            address = :address,
            institution = :institution,
            bio = :bio,
            gender = :gender,
            date_of_birth = :date_of_birth,
            phone_number = :phone_number,
            website = :website,
            github = :github,
            twitter = :twitter,
            linkedin = :linkedin,
            facebook = :facebook,
            telegram = :telegram
          WHERE username = :username"
  ```
  #image("ss/5.png", width: 100%, height: auto, alt: "PSTU")

=== Blog

+ *Get all blogs*
  ```sql
    SELECT blogs.ID, blogs.title, blogs.content, blogs.created_at, users.username, blogs.is_published
    FROM blogs
    JOIN users ON blogs.author_id = users.ID
    WHERE blogs.is_published = 1 OR blogs.author_id = 1
    ORDER BY blogs.created_at DESC

    # ID, title, content, created_at, username, is_published
  '9', 'Testing publishing feature of blogs!', 'This should be published publicly...', '2025-05-26 04:31:06', 'sharafat', '1'
  ```
  #image("ss/6.png", width: 100%, height: auto, alt: "PSTU")

+ *Insert a new data (blog)*
  ```sql
  INSERT INTO blogs (author_id, title, content, is_published) VALUES (:author_id, :title, :content, :is_published)
  ```
  #image("ss/7.png", width: 100%, height: auto, alt: "PSTU")

+ *Update a blog*
  ```sql
  UPDATE blogs SET
            title = :title,
            content = :content,
            is_published = :is_published
          WHERE ID = :blog_id"
  ```
  #image("ss/8.png", width: 100%, height: auto, alt: "PSTU")

+ *Delete a blog*
  ```sql
  DELETE FROM blogs WHERE ID = :blog_id
  ```

=== Comment & React

+ *Insert a new comment*
  ```sql
  INSERT INTO blog_comments (blog_id, user_id, comment) VALUES (:blog_id, :user_id, :comment)
  ```
  #image("ss/9.png", width: 100%, height: auto, alt: "PSTU")

+ *Get all comments for a blog*
  ```sql
    SELECT blog_comments.comment, blog_comments.created_at, users.username
    FROM blog_comments
    JOIN users
    ON blog_comments.user_id = 1
    WHERE blog_comments.blog_id = 1
    ORDER BY blog_comments.created_at DESC

    # comment, created_at, username
  'interesting!', '2025-05-24 03:37:50', 'a'
  ```
+ *Fetch reactions*
  ```sql
  SELECT reaction, COUNT(*) as count
  FROM blog_reactions
  WHERE blog_id = 1 GROUP BY reaction
  ```

=== feedback

+ *Insert a new feedback*
  ```sql
  INSERT INTO feedback (user_id, name, email, feedback, website) VALUES (:user_id, :name, :email, :feedback, :website)
  ```
  #image("ss/10.png", width: 100%, height: auto, alt: "PSTU")

=== Contest

+ *Get all upcoming contests*
  ```sql
  SELECT contests.*, users.username 
  FROM contests 
  JOIN users 
	  ON contests.created_by = users.ID 
  WHERE contests.start_time > NOW() 
  ORDER BY contests.start_time ASC;
```

+ *Get all ongoing contests*
  ```sql
SELECT contests.*, users.username 
FROM contests 
JOIN users 
	ON contests.created_by = users.ID 
WHERE contests.start_time <= NOW() 
	AND contests.end_time > NOW() 
ORDER BY contests.start_time ASC;
```
  #image("ss/11.png", width: 100%, height: auto, alt: "PSTU")

+ *Get all previous contests*
  ```sql
  SELECT contests.*, users.username 
  FROM contests 
  JOIN users 
    ON contests.created_by = users.ID 
  WHERE contests.end_time <= NOW()
  ORDER BY contests.start_time ASC;

# ID, title, description, start_time, end_time, is_public, created_by, created_at, username
'3', 'A past title!', 'A title happended to be happed in the past.', '1992-06-13 00:00:00', '2000-06-21 00:00:00', '1', '1', '2025-06-13 05:03:46', 'sharafat'
'2', 'Second one...', 'A second contest!', '2025-06-13 10:00:00', '2025-06-13 11:00:00', '1', '1', '2025-06-13 04:28:17', 'sharafat'
'1', 'Initial contest', 'An initial contest to test how things are, XD', '2025-06-13 22:00:00', '2025-06-13 13:00:00', '1', '1', '2025-06-13 04:22:07', 'sharafat'
```
+ *Add new contest*
  ```sql
INSERT INTO contests (title, description, start_time, end_time, is_public, created_by) 
VALUES (:title, :description, :start_time, :end_time, :is_public, :created_by)
```
  #image("ss/12.png", width: 85%, height: auto, alt: "PSTU")

+ *Update contest*
  ```sql
  UPDATE contests SET
            title = :title,
            description = :description,
            start_time = :start_time,
            end_time = :end_time,
            is_public = :is_public
          WHERE ID = :contest_id"
  ```
  #image("ss/13.png", width: 85%, height: auto, alt: "PSTU")

+ *Delete contest*
  ```sql
  DELETE FROM contests WHERE ID = :contest_id
  ```
  #image("ss/14.png", width: 90%, height: auto, alt: "PSTU")

=== Problemsets

+ *Add a new problem*
  ```sql
  INSERT INTO problems (contest_id, title, description, difficulty, time_limit, memory_limit) 
  VALUES (:contest_id, :title, :description, :difficulty, :time_limit, :memory_limit)
  ```
  #image("ss/15.png", width: 95%, height: auto, alt: "PSTU")

+ *Delete a problem*
  ```sql
  DELETE FROM problems WHERE ID = :problem_id
  ```

+ *Get all problems from previous contests*
  ```sql
  SELECT problems.*, contests.title AS contest_title 
  FROM problems 
  JOIN contests 
  ON problems.contest_id = contests.ID 
  WHERE contests.end_time <= NOW()
  ORDER BY contests.end_time DESC, problems.ID ASC;

  # ID, contest_id, title, description, difficulty, time_limit, memory_limit, created_at, contest_title
'2', '1', 'Bye! Bye!', 'Print the title!', 'easy', '2', '256', '2025-06-13 15:42:11', 'Initial contest'
```
  #image("ss/16.png", width: 100%, height: auto, alt: "PSTU")

=== Leaderboard

+ *Get top 5 users based on total_solved*
  ```sql
    SELECT *
    FROM top_rated_5

  # username, first_name, last_name, total_solved
  'sharafat', 'Sharafat', 'Karim', '1'
  'a', 'A', 'B', '0'
  'b', 'b', 'b', '0'
  ```
  #image("ss/17.png", width: 45%, height: auto, alt: "PSTU")

+ *Get 50 user's rank based on total_contribution*
  ```sql
  SELECT first_name, last_name, username, total_contributions
                    FROM users
                    ORDER BY total_contributions DESC
                    LIMIT 50"

  # first_name, last_name, username, total_solved
  'Sharafat', 'Karim', 'sharafat', '1'
  'A', 'B', 'a', '2'
  'b', 'b', 'b', '0'
  ```

+ *Get 50 user's rank based on total_submission*
  ```sql
  SELECT first_name, last_name, username, total_submissions
                    FROM users
                    ORDER BY total_submissions DESC
                    LIMIT 50

  # first_name, last_name, username, total_submissions
  'Sharafat', 'Karim', 'sharafat', '1'
  'A', 'B', 'a', '2'
  'b', 'b', 'b', '0'
  ```
  #image("ss/19.png", width: 100%, height: auto, alt: "PSTU")

+ *Get 50 user's rank based on total_contribution*
  ```sql
    SELECT first_name, last_name, username, total_contributions
                    FROM users
                    ORDER BY total_contributions DESC
                    LIMIT 50

  # first_name, last_name, username, total_contributions
  'Sharafat', 'Karim', 'sharafat', '32'
  'A', 'B', 'a', '1'
  'b', 'b', 'b', '0'

  ```
  #image("ss/18.png", width: 100%, height: auto, alt: "PSTU")

=== Newsletters
+ *Insert a new newsletter subscription*
  ```sql
  INSERT INTO newsletters (email) VALUES (:email)
  ```
  #image("ss/20.png", width: 100%, height: auto, alt: "PSTU")

= Limitations
- The platform is currently hosted on a free hosting service, which may have limitations on performance and uptime.
- Currenty the creator of the contest has to manually review the submissions and update the user scores. This can be automated in the future. 
- Markdown editor is not implemented yet, so users cannot format their blogs and comments using markdown syntax everywhere.

= Conclusion
Finally we can conclude that, SQL Judge platform will help mentors and teachers to help spreading the knowledge of SQL and database management. It will also help students to learn and practice SQL queries in a fun and interactive way. The platform is designed to be user-friendly and easy to navigate, making it accessible to users of all skill levels.


= References

== Documentations
- #link("https://www.w3schools.com/html/") [*W3Schools HTML*]
- #link("https://www.w3schools.com/css/") [*W3Schools CSS*]
- #link("https://www.w3schools.com/js/") [*W3Schools JavaScript*]
- #link("https://www.w3schools.com/sql/") [*W3Schools SQL*]
- #link("https://www.php.net/manual/en/") [*PHP Manual*]
- #link("https://www.w3schools.com/php/default.asp") [*W3Schools PHP*]


#align(center + bottom)[
  *THE END*
]
