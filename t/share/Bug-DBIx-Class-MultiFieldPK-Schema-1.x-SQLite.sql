-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Sun Oct  9 21:47:37 2011
-- 

BEGIN TRANSACTION;

--
-- Table: image
--
DROP TABLE image;

CREATE TABLE image (
  image_id INTEGER PRIMARY KEY NOT NULL,
  title varchar(255) NOT NULL
);

--
-- Table: user
--
DROP TABLE user;

CREATE TABLE user (
  user_id INTEGER PRIMARY KEY NOT NULL,
  name varchar NOT NULL
);

--
-- Table: user_image_downloaded
--
DROP TABLE user_image_downloaded;

CREATE TABLE user_image_downloaded (
  downloaded_id int NOT NULL,
  fk_user_id int NOT NULL,
  fk_image_id int NOT NULL,
  PRIMARY KEY (downloaded_id, fk_user_id, fk_image_id),
  FOREIGN KEY(fk_image_id) REFERENCES image(image_id),
  FOREIGN KEY(fk_user_id) REFERENCES user(user_id)
);

CREATE INDEX user_image_downloaded_idx_fk_image_id ON user_image_downloaded (fk_image_id);

CREATE INDEX user_image_downloaded_idx_fk_user_id ON user_image_downloaded (fk_user_id);

CREATE UNIQUE INDEX user_image_downloaded_downloaded_id ON user_image_downloaded (downloaded_id);

COMMIT;
