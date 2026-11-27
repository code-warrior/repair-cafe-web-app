CREATE TABLE `member` (
  `id`                     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name`             VARCHAR(128) NOT NULL,
  `preferred_name`         VARCHAR(128) NULL,
  `last_name`              VARCHAR(128) NULL,
  `email`                  VARCHAR(320) NOT NULL UNIQUE,
  `phone`                  VARCHAR(20) NULL,
  `profile_pic_filepath`   VARCHAR(256) NULL,
  `initial_contact_date`   DATE NULL,
  `start_date`             DATE NULL,
  `created_at`             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`             TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `initial_contact_method` ENUM('website', 'in-person') NULL,
  `comment`                TEXT NULL,

  PRIMARY KEY (`id`),

  CONSTRAINT check_email_length CHECK (
    CHAR_LENGTH(email) >= 6 AND email LIKE '%@%._%'
  ),

  CONSTRAINT check_phone_digits CHECK (
    phone REGEXP '^[0-9]+$'
  ),

  INDEX `idx_member_name` (`last_name`, `first_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER $$

CREATE TRIGGER trg_member_before_insert
BEFORE INSERT ON member
FOR EACH ROW
BEGIN
  SET NEW.first_name           = LOWER(TRIM(NEW.first_name));
  SET NEW.email                = LOWER(TRIM(NEW.email));
  SET NEW.preferred_name       = NULLIF(LOWER(TRIM(NEW.preferred_name)), '');
  SET NEW.last_name            = NULLIF(LOWER(TRIM(NEW.last_name)), '');
  SET NEW.phone                = NULLIF(TRIM(NEW.phone), '');
  SET NEW.profile_pic_filepath = NULLIF(TRIM(NEW.profile_pic_filepath), '');
  SET NEW.comment              = NULLIF(TRIM(NEW.comment), '');
END$$

CREATE TRIGGER trg_member_before_update
BEFORE UPDATE ON member
FOR EACH ROW
BEGIN
  SET NEW.first_name           = LOWER(TRIM(NEW.first_name));
  SET NEW.email                = LOWER(TRIM(NEW.email));
  SET NEW.preferred_name       = NULLIF(LOWER(TRIM(NEW.preferred_name)), '');
  SET NEW.last_name            = NULLIF(LOWER(TRIM(NEW.last_name)), '');
  SET NEW.phone                = NULLIF(TRIM(NEW.phone), '');
  SET NEW.profile_pic_filepath = NULLIF(TRIM(NEW.profile_pic_filepath), '');
  SET NEW.comment              = NULLIF(TRIM(NEW.comment), '');
END$$

DELIMITER ;
