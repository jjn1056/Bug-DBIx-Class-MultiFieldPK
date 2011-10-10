-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Sun Oct  9 22:15:44 2011
-- 
--
-- Table: image
--
DROP TABLE "image" CASCADE;
CREATE TABLE "image" (
  "image_id" serial NOT NULL,
  "title" character varying(255) NOT NULL,
  PRIMARY KEY ("image_id")
);

--
-- Table: user
--
DROP TABLE "user" CASCADE;
CREATE TABLE "user" (
  "user_id" serial NOT NULL,
  "name" character varying(255) NOT NULL,
  PRIMARY KEY ("user_id")
);

--
-- Table: user_image_downloaded
--
DROP TABLE "user_image_downloaded" CASCADE;
CREATE TABLE "user_image_downloaded" (
  "downloaded_id" serial NOT NULL,
  "fk_user_id" integer NOT NULL,
  "fk_image_id" integer NOT NULL,
  PRIMARY KEY ("downloaded_id")
);
CREATE INDEX "user_image_downloaded_idx_fk_image_id" on "user_image_downloaded" ("fk_image_id");
CREATE INDEX "user_image_downloaded_idx_fk_user_id" on "user_image_downloaded" ("fk_user_id");

--
-- Foreign Key Definitions
--

ALTER TABLE "user_image_downloaded" ADD FOREIGN KEY ("fk_image_id")
  REFERENCES "image" ("image_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

ALTER TABLE "user_image_downloaded" ADD FOREIGN KEY ("fk_user_id")
  REFERENCES "user" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

