CREATE TABLE `db_privilege` (
  `id`     TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `access` ENUM('app_read', 'app_write', 'app_developer') NOT NULL UNIQUE,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
