DROP SCHEMA IF EXISTS patreon;

CREATE SCHEMA patreon;

CREATE TABLE `patreon`.`categories`(
  `categoryid` INT NOT NULL,
  `categoryname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryid`)
);

CREATE TABLE `patreon`.`users` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `categoryid` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`userid`),
  FOREIGN KEY (`categoryid`) REFERENCES categories(`categoryid`)
);
  
CREATE TABLE `patreon`.`contents` (
  `contentid` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `content_file` VARCHAR(100),
  `content_message` VARCHAR(100),
  `content_level` INT NOT NULL,
  PRIMARY KEY (`contentid`),
  FOREIGN KEY (`userid`) REFERENCES users(`userid`)
);

CREATE TABLE `patreon`.`subs` (
  `userid` INT NOT NULL,
  `subbedtoid` INT NOT NULL,
  `sublevel` INT NOT NULL
);

INSERT INTO `patreon`.`categories`
VALUES (1, 'Digital Art'),
(2, 'Music'),
(3, 'Crafts'),
(4, 'Animation'),
(5, 'Podcasts'),
(6, 'Game'),
(7, 'Gameplay')
;

INSERT INTO `patreon`.`users`
VALUES (100000, 7, 'dg_kirito', 'dg_kirito@gmail.com', 'password', 'I play LoL all day and my favorite anime is SAO'),
(100001, 1, 'faeruumi', 'faeruumigmail.com', 'password', 'I like drawing and I hate SAO')
;

INSERT INTO `patreon`.`contents`
VALUES (200000, 100000, 'file.mp4', 'TOP 10 KIRITO MOMENTS IN SAO!', 0),
(200001, 100001, 'file.mp4', 'WATCH ME RANT AT SAO!', 0)
;

INSERT INTO `patreon`.`subs`
VALUES (100000, 100001, 1);