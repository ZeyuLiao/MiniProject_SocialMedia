CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  father_id INT,
  from_name VARCHAR(255) NOT NULL,
  to_name VARCHAR(255),
  datetime DATETIME NOT NULL,
  content VARCHAR(255) NOT NULL
);