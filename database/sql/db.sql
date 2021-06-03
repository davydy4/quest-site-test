-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.3.13-MariaDB-log - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных ilocked-test
CREATE DATABASE IF NOT EXISTS `ilocked-test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ilocked-test`;

-- Дамп структуры для таблица ilocked-test.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `quest_id` bigint(20) unsigned NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `date_time` int(11) NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_quest_id_foreign` (`quest_id`),
  CONSTRAINT `bookings_quest_id_foreign` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.bookings: ~0 rows (приблизительно)
DELETE FROM `bookings`;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`id`, `user_id`, `quest_id`, `status`, `date_time`, `price`, `created_at`, `updated_at`) VALUES
	(1, 2, 2, 2, 1622880000, 3500.00, '2021-06-03 00:50:19', '2021-06-03 00:50:51'),
	(2, 3, 2, 1, 1622894400, 4000.00, '2021-06-03 01:50:34', '2021-06-03 01:50:34'),
	(3, 2, 2, 2, 1622732400, 4000.00, '2021-06-03 01:51:41', '2021-06-03 01:52:56'),
	(4, 2, 2, 2, 1622727000, 3500.00, '2021-06-03 01:54:04', '2021-06-03 02:30:35'),
	(5, 2, 4, 3, 1622901600, 5000.00, '2021-06-03 02:29:42', '2021-06-03 02:31:04'),
	(6, 2, 4, 1, 1622732400, 4000.00, '2021-06-03 02:29:55', '2021-06-03 02:29:55'),
	(7, 2, 4, 1, 1622901600, 5000.00, '2021-06-03 02:31:31', '2021-06-03 02:31:31'),
	(8, 2, 4, 1, 1622894400, 4000.00, '2021-06-03 02:35:19', '2021-06-03 02:35:19'),
	(9, 2, 4, 1, 1622980800, 4000.00, '2021-06-03 02:35:45', '2021-06-03 02:35:45');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.failed_jobs: ~0 rows (приблизительно)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.migrations: ~8 rows (приблизительно)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2021_06_01_161003_create_quests_table', 1),
	(6, '2021_06_01_161055_create_times_table', 1),
	(7, '2021_06_01_161132_create_bookings_table', 1),
	(8, '2021_06_01_165647_create_permission_tables', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.model_has_permissions: ~0 rows (приблизительно)
DELETE FROM `model_has_permissions`;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.model_has_roles: ~1 rows (приблизительно)
DELETE FROM `model_has_roles`;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.password_resets: ~0 rows (приблизительно)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.permissions: ~0 rows (приблизительно)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.quests
CREATE TABLE IF NOT EXISTS `quests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.quests: ~2 rows (приблизительно)
DELETE FROM `quests`;
/*!40000 ALTER TABLE `quests` DISABLE KEYS */;
INSERT INTO `quests` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'Квест', '/files\\2belki_psihiatria_2.jpg', '2021-06-03 00:41:55', '2021-06-03 00:43:37'),
	(2, 'Квест 2', '/files\\6-parallel_idealnaya-kukla_1.jpg', '2021-06-03 00:44:03', '2021-06-03 00:44:03'),
	(3, 'Страшный квест', '/files\\pogruzhenie_professor_vudu_1.jpg', '2021-06-03 02:23:46', '2021-06-03 02:23:46'),
	(4, 'Детский квест', '/files\\seriozniye-igri_prokljatie-ramzesa_1.jpg', '2021-06-03 02:24:31', '2021-06-03 02:24:31');
/*!40000 ALTER TABLE `quests` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.roles: ~2 rows (приблизительно)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'web', '2021-06-03 00:41:57', '2021-06-03 00:41:57'),
	(2, 'user', 'web', '2021-06-03 00:41:57', '2021-06-03 00:41:57');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.role_has_permissions: ~0 rows (приблизительно)
DELETE FROM `role_has_permissions`;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.times
CREATE TABLE IF NOT EXISTS `times` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quest_id` bigint(20) unsigned NOT NULL,
  `day` smallint(6) NOT NULL,
  `time` time NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `times_quest_id_foreign` (`quest_id`),
  CONSTRAINT `times_quest_id_foreign` FOREIGN KEY (`quest_id`) REFERENCES `quests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.times: ~15 rows (приблизительно)
DELETE FROM `times`;
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
INSERT INTO `times` (`id`, `quest_id`, `day`, `time`, `price`, `created_at`, `updated_at`) VALUES
	(195, 2, 1, '10:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(196, 2, 2, '10:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(197, 2, 3, '10:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(198, 2, 4, '10:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(199, 2, 5, '10:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(200, 2, 1, '12:00:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(201, 2, 2, '12:00:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(202, 2, 3, '12:00:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(203, 2, 4, '12:00:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(204, 2, 5, '12:00:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(205, 2, 1, '13:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(206, 2, 2, '13:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(207, 2, 3, '13:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(208, 2, 4, '13:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(209, 2, 5, '13:30:00', 3000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(210, 2, 1, '15:00:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(211, 2, 2, '15:00:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(212, 2, 3, '15:00:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(213, 2, 4, '15:00:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(214, 2, 5, '15:00:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(215, 2, 1, '16:30:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(216, 2, 2, '16:30:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(217, 2, 3, '16:30:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(218, 2, 4, '16:30:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(219, 2, 5, '16:30:00', 3500.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(220, 2, 1, '18:00:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(221, 2, 2, '18:00:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(222, 2, 3, '18:00:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(223, 2, 4, '18:00:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(224, 2, 5, '18:00:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(225, 2, 6, '18:00:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(226, 2, 7, '18:00:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(227, 2, 1, '19:30:00', 4000.00, '2021-06-02 15:23:01', '2021-06-02 15:23:01'),
	(228, 2, 2, '19:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(229, 2, 3, '19:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(230, 2, 4, '19:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(231, 2, 5, '19:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(232, 2, 6, '19:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(233, 2, 7, '19:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(234, 2, 1, '21:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(235, 2, 2, '21:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(236, 2, 3, '21:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(237, 2, 4, '21:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(238, 2, 5, '21:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(239, 2, 6, '21:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(240, 2, 7, '21:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(241, 2, 6, '11:00:00', 3500.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(242, 2, 7, '11:00:00', 3500.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(243, 2, 6, '12:20:00', 3500.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(244, 2, 7, '12:20:00', 3500.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(245, 2, 6, '13:40:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(246, 2, 7, '13:40:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(247, 2, 6, '15:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(248, 2, 7, '15:00:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(249, 2, 6, '16:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(250, 2, 7, '16:30:00', 4000.00, '2021-06-02 15:23:02', '2021-06-02 15:23:02'),
	(251, 1, 1, '11:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(252, 1, 2, '11:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(253, 1, 3, '11:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(254, 1, 4, '11:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(255, 1, 5, '11:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(256, 1, 1, '13:30:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(257, 1, 2, '13:30:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(258, 1, 3, '13:30:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(259, 1, 4, '13:30:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(260, 1, 5, '13:30:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(261, 1, 6, '13:30:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(262, 1, 7, '13:30:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(263, 1, 1, '15:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(264, 1, 2, '15:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(265, 1, 3, '15:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(266, 1, 4, '15:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(267, 1, 5, '15:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(268, 1, 6, '15:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(269, 1, 7, '15:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(270, 1, 1, '17:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(271, 1, 2, '17:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(272, 1, 3, '17:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(273, 1, 4, '17:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(274, 1, 5, '17:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(275, 1, 6, '17:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(276, 1, 7, '17:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(277, 1, 1, '19:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(278, 1, 2, '19:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(279, 1, 3, '19:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(280, 1, 4, '19:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(281, 1, 5, '19:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(282, 1, 6, '19:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(283, 1, 7, '19:00:00', 3000.00, '2021-06-03 00:49:46', '2021-06-03 00:49:46'),
	(284, 3, 1, '12:00:00', 3000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(285, 3, 2, '12:00:00', 3000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(286, 3, 3, '12:00:00', 3000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(287, 3, 4, '12:00:00', 3000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(288, 3, 5, '12:00:00', 3000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(289, 3, 6, '12:00:00', 3000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(290, 3, 7, '12:00:00', 3000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(291, 3, 1, '15:00:00', 4000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(292, 3, 2, '15:00:00', 4000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(293, 3, 3, '15:00:00', 4000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(294, 3, 4, '15:00:00', 4000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(295, 3, 5, '15:00:00', 4000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(296, 3, 6, '15:00:00', 4000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(297, 3, 7, '15:00:00', 4000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(298, 3, 1, '18:00:00', 4500.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(299, 3, 2, '18:00:00', 4500.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(300, 3, 3, '18:00:00', 4500.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(301, 3, 4, '18:00:00', 4500.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(302, 3, 5, '18:00:00', 4500.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(303, 3, 6, '18:00:00', 4500.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(304, 3, 7, '18:00:00', 4500.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(305, 3, 1, '21:00:00', 5000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(306, 3, 2, '21:00:00', 5000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(307, 3, 3, '21:00:00', 5000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(308, 3, 4, '21:00:00', 5000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(309, 3, 5, '21:00:00', 5000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(310, 3, 6, '21:00:00', 5000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(311, 3, 7, '21:00:00', 5000.00, '2021-06-03 02:26:18', '2021-06-03 02:26:18'),
	(347, 4, 1, '11:30:00', 3000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(348, 4, 2, '11:30:00', 3000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(349, 4, 3, '11:30:00', 3000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(350, 4, 4, '11:30:00', 3000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(351, 4, 5, '11:30:00', 3000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(352, 4, 6, '11:30:00', 3000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(353, 4, 7, '11:30:00', 3000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(354, 4, 1, '13:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(355, 4, 2, '13:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(356, 4, 3, '13:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(357, 4, 4, '13:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(358, 4, 5, '13:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(359, 4, 6, '13:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(360, 4, 7, '13:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(361, 4, 1, '15:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(362, 4, 2, '15:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(363, 4, 3, '15:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(364, 4, 4, '15:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(365, 4, 5, '15:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(366, 4, 6, '15:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(367, 4, 7, '15:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(368, 4, 6, '15:30:00', 4500.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(369, 4, 7, '15:30:00', 4500.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(370, 4, 6, '17:00:00', 5000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(371, 4, 7, '17:00:00', 5000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(372, 4, 1, '18:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(373, 4, 2, '18:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(374, 4, 3, '18:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(375, 4, 4, '18:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(376, 4, 5, '18:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(377, 4, 6, '18:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(378, 4, 7, '18:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(379, 4, 6, '18:30:00', 5000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(380, 4, 7, '18:30:00', 5000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(381, 4, 1, '21:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(382, 4, 2, '21:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(383, 4, 3, '21:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(384, 4, 4, '21:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(385, 4, 5, '21:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(386, 4, 6, '21:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(387, 4, 7, '21:00:00', 4000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(388, 4, 6, '20:00:00', 5000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00'),
	(389, 4, 7, '20:00:00', 5000.00, '2021-06-03 02:29:00', '2021-06-03 02:29:00');
/*!40000 ALTER TABLE `times` ENABLE KEYS */;

-- Дамп структуры для таблица ilocked-test.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы ilocked-test.users: ~1 rows (приблизительно)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@admin.ru', '+7 (999) 999-99-99', NULL, '$2y$10$pzYhQqY0k1O86/gmXkv9U.QyrHY1sDbeByGEYQzsXfNyQtki4WZoq', NULL, NULL, NULL, '2021-06-03 00:41:55', '2021-06-03 00:41:55'),
	(2, 'Денис', 'davydy4@mail.ru', '+7 (950) 048-89-99', NULL, NULL, NULL, NULL, NULL, '2021-06-03 00:50:19', '2021-06-03 00:50:19'),
	(3, 'Денис', 'davydy4@gmail.com', '+7 (950) 048-89-99', NULL, NULL, NULL, NULL, NULL, '2021-06-03 01:50:34', '2021-06-03 01:50:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
