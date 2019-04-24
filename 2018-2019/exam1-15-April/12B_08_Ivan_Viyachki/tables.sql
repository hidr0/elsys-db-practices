CREATE TABLE users (
	id INTEGER AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    numer_of_total_views INTEGER,
    
	PRIMARY KEY(id)

);

CREATE TABLE channels (
	id INTEGER AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    user_id INTEGER DEFAULT 0,
    
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE videos (
	id INTEGER AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    channel_id INTEGER DEFAULT 0,
    views INTEGER NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(channel_id) REFERENCES channels(id)
);
