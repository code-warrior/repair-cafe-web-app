CREATE TABLE `skills` (
  `skill_id`    INT          AUTO_INCREMENT,
  `name`        VARCHAR(128) UNIQUE NOT NULL,
  `description` VARCHAR(512),

  PRIMARY KEY (`skill_id`),
  FULLTEXT INDEX `ftix_skills_description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
