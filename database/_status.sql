CREATE TABLE `status` (
  `id`     TINYINT UNSIGNED AUTO_INCREMENT,
  `current` ENUM('active', 'inactive', 'terminated') NOT NULL DEFAULT 'inactive',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
