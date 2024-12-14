CREATE DATABASE db_coderhouse_gallery;
USE db_coderhouse_gallery;
CREATE TABLE User (
user_id INT AUTO_INCREMENT,
username VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR(50) NOT NULL UNIQUE,
contrasenia VARCHAR(50) NOT NULL, 
PRIMARY KEY (user_id)
);

CREATE TABLE Role (
role_id INT AUTO_INCREMENT,
role_name VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (role_id)
);

CREATE TABLE User_role (
user_id INT,
role_id INT,

CONSTRAINT fk_user_user_roles
	FOREIGN KEY (user_id)
    REFERENCES User(user_id)
    ON DELETE CASCADE,
    
CONSTRAINT fk_role_user_roles
	FOREIGN KEY (role_id)
    REFERENCES Role(role_id)
    ON DELETE CASCADE
);

CREATE TABLE Image (
image_id INT AUTO_INCREMENT,
user_id INT,
image_url VARCHAR(255) NOT NULL,
title VARCHAR(100),
upload_date DATE,

PRIMARY KEY (image_id),
CONSTRAINT fk_user_image
	FOREIGN KEY (user_id)
    REFERENCES User(user_id)
    ON DELETE CASCADE
);

CREATE TABLE Comment (
comment_id INT AUTO_INCREMENT,
user_id INT,
image_id INT,
content VARCHAR(255) NOT NULL,
upload_date DATE,

PRIMARY KEY (comment_id),
CONSTRAINT fk_user_comment
	FOREIGN KEY (user_id)
    REFERENCES User(user_id),
CONSTRAINT fk_image_comment
	FOREIGN KEY (image_id)
    REFERENCES Image(image_id)
    ON DELETE CASCADE
);

CREATE TABLE Tag (
tag_id INT AUTO_INCREMENT,
tag_name VARCHAR(255) UNIQUE NOT NULL,

PRIMARY KEY (tag_id)
);

CREATE TABLE Image_tag (
tag_id INT,
image_id INT,

CONSTRAINT fk_tag_image_tag
	FOREIGN KEY(tag_id)
    REFERENCES Tag(tag_id),
CONSTRAINT  fk_image_image_tag
	FOREIGN KEY(image_id)
    REFERENCES Image(image_id)
);

CREATE TABLE Like_dislike (
like_dislike_id INT AUTO_INCREMENT,
is_like BOOL,
image_id INT,
user_id INT,

PRIMARY KEY(like_dislike_id),
CONSTRAINT fk_image_like_dislike
	FOREIGN KEY(image_id)
    REFERENCES Image(image_id)
    ON DELETE CASCADE,
CONSTRAINT fk_user_like_dislike
	FOREIGN KEY(user_id)
    REFERENCES User(user_id)
);