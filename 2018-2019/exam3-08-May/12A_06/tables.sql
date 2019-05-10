CREATE TABLE T_User(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    number_of_likes_on_own_posts INT NOT NULL DEFAULT 0
);

CREATE TABLE T_Post(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    post_name VARCHAR(255) NOT NULL,
    user_id INT,
    
    FOREIGN KEY (user_id) REFERENCES T_User(id)
);

CREATE TABLE Likes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    
    FOREIGN KEY (user_id) REFERENCES T_User(id),
    FOREIGN KEY (post_id) REFERENCES T_Post(id)
);