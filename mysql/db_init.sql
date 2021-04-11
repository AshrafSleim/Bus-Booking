-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2021 at 11:15 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$OeRxePIVYiDzAVrUj/Q2uO7fJOOAHiniTtyNa/2y32vMNRcyQGKaC', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `busNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `busNumber`, `created_at`, `updated_at`) VALUES
(1, '123ط ع ه', '2021-04-11 05:29:34', '2021-04-11 05:29:34'),
(3, '123ط ه', '2021-04-11 05:31:51', '2021-04-11 05:31:51'),
(4, '123ه', '2021-04-11 05:32:31', '2021-04-11 05:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_04_10_175907_create_admins_table', 2),
(10, '2021_04_10_221910_create_buses_table', 3),
(11, '2021_04_10_223406_create_stations_table', 4),
(12, '2021_04_11_000545_create_trips_table', 5),
(13, '2021_04_11_000608_create_trip_stations_table', 5),
(14, '2021_04_11_023924_create_reservations_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1317ad9f97356c0e35e206d19c77de2711efc7f45270fe35a8789795fc5e32cfd155f756548e116f', 1, 1, 'MyApp', '[\"admin\"]', 0, '2021-04-11 02:31:54', '2021-04-11 02:31:54', '2022-04-10 19:31:54'),
('20939f8ac2b51a7f4e78f55020a9198fdd1e7d93c3eb388a1afa7c0757e71cf7efce04d1f1d7ce24', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-04-11 02:28:21', '2021-04-11 02:28:21', '2022-04-10 19:28:21'),
('261edc982c3658394a55558f4eeee198b237bbc08a4302861c5339c33fef0023c255392b6bb27791', 1, 1, 'MyApp', '[\"admin\"]', 0, '2021-04-11 02:12:30', '2021-04-11 02:12:30', '2022-04-10 19:12:30'),
('32f9390ff154db33370dff236a94b71df8a2e37c73a5b0d3a087ae34e99e36f6a8188bed9b8776fc', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-04-11 03:07:55', '2021-04-11 03:07:55', '2022-04-10 20:07:55'),
('433c52d9adc8ebb988d8d0a8a32d36867c158d6a3dea0d619c3f7af14f3e2859d6878bda9bbb0795', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-04-11 11:23:19', '2021-04-11 11:23:19', '2022-04-11 04:23:19'),
('4499500e21fd2aacc1d932b81700949ef84d2ed3c03cd01982b209123244a53b52ea4d9b9da1e7a9', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-04-11 12:45:10', '2021-04-11 12:45:10', '2022-04-11 05:45:10'),
('4fc78aeedcdb0ca86a81aad7157f15d1e0c8a20ae4c1e091959d0e5673666e617a7bf6fd7aff8916', 1, 1, 'MyApp', '[\"admin\"]', 0, '2021-04-11 01:45:57', '2021-04-11 01:45:57', '2022-04-10 18:45:57'),
('84a3e66cf7172b100cf58407997bdbc366d62ce7eb5247d8a060ea825532c28274427650349f146e', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-04-11 02:31:24', '2021-04-11 02:31:24', '2022-04-10 19:31:24'),
('85ace4df3d77b9e6625cc3e82f83f2e63053259cc29ef223d090ae298ed194fb2af9957b2626715c', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-04-11 20:35:16', '2021-04-11 20:35:16', '2022-04-11 13:35:16'),
('b9dafaa62d5a1072275ea69ff26313ce5045036871954f285875a237cc18be7a4c97994e657ab379', 1, 1, 'MyApp', '[\"admin\"]', 0, '2021-04-11 03:04:48', '2021-04-11 03:04:48', '2022-04-10 20:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'xDT3aPkx9v2J3Of0cqDiWzhPL067efO2Gv1h5YB3', NULL, 'http://localhost', 1, 0, 0, '2021-04-11 00:58:55', '2021-04-11 00:58:55'),
(2, NULL, 'Laravel Password Grant Client', 'zzQNuCeuAW2xnQXB63xDlg2DArSFGczYM5d2Sggp', 'users', 'http://localhost', 0, 1, 0, '2021-04-11 00:58:55', '2021-04-11 00:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-11 00:58:55', '2021-04-11 00:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `IDTrip` bigint(20) UNSIGNED NOT NULL,
  `seatNumber` int(11) NOT NULL,
  `startStationOrder` bigint(20) UNSIGNED NOT NULL,
  `endStationOrder` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `IDTrip`, `seatNumber`, `startStationOrder`, `endStationOrder`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 0, 1, '2021-04-11 22:28:30', '2021-04-11 22:28:30'),
(2, 3, 1, 1, 2, '2021-04-11 22:32:45', '2021-04-11 22:32:45'),
(3, 2, 1, 0, 1, '2021-04-11 22:45:10', '2021-04-11 22:45:10'),
(4, 2, 8, 0, 1, '2021-04-11 22:45:28', '2021-04-11 22:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `StationName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `StationName`, `created_at`, `updated_at`) VALUES
(1, 'Cairo', '2021-04-11 06:14:22', '2021-04-11 06:14:22'),
(2, 'Giza', '2021-04-11 06:14:50', '2021-04-11 06:14:50'),
(3, 'AlFayyum', '2021-04-11 06:15:01', '2021-04-11 06:15:01'),
(4, 'AlMinya', '2021-04-11 06:15:10', '2021-04-11 06:15:10'),
(5, 'Asyut', '2021-04-11 06:15:19', '2021-04-11 06:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `IDBus` bigint(20) UNSIGNED DEFAULT NULL,
  `startStation` bigint(20) UNSIGNED DEFAULT NULL,
  `endStation` bigint(20) UNSIGNED DEFAULT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  `status` enum('ended','cancel','Preparation') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Preparation',
  `cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `IDBus`, `startStation`, `endStation`, `startDateTime`, `endDateTime`, `status`, `cost`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 3, '2021-04-11 08:20:36', '2021-04-11 18:20:36', 'Preparation', 0.00, '2021-04-11 08:56:48', '2021-04-11 08:56:48'),
(3, 1, 1, 4, '2021-04-12 08:20:36', '2021-04-12 18:20:36', 'Preparation', 0.00, '2021-04-11 09:37:17', '2021-04-11 09:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `trip_stations`
--

CREATE TABLE `trip_stations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `IDTrip` bigint(20) UNSIGNED NOT NULL,
  `IDStation` bigint(20) UNSIGNED NOT NULL,
  `StationOrder` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trip_stations`
--

INSERT INTO `trip_stations` (`id`, `IDTrip`, `IDStation`, `StationOrder`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, '2021-04-11 08:56:48', '2021-04-11 08:56:48'),
(2, 2, 2, 1, '2021-04-11 08:56:49', '2021-04-11 08:56:49'),
(3, 2, 3, 2, '2021-04-11 08:56:49', '2021-04-11 08:56:49'),
(4, 3, 1, 0, '2021-04-11 09:37:17', '2021-04-11 09:37:17'),
(5, 3, 3, 1, '2021-04-11 09:37:17', '2021-04-11 09:37:17'),
(6, 3, 4, 2, '2021-04-11 09:37:17', '2021-04-11 09:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet` double(8,2) NOT NULL DEFAULT 0.00,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `wallet`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ashraf', '01288501654', 'ashrafsleim48@gmail.com', 0.00, NULL, '$2y$10$OeRxePIVYiDzAVrUj/Q2uO7fJOOAHiniTtyNa/2y32vMNRcyQGKaC', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buses_busnumber_unique` (`busNumber`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_idtrip_foreign` (`IDTrip`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stations_stationname_unique` (`StationName`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_idbus_foreign` (`IDBus`),
  ADD KEY `trips_startstation_foreign` (`startStation`),
  ADD KEY `trips_endstation_foreign` (`endStation`);

--
-- Indexes for table `trip_stations`
--
ALTER TABLE `trip_stations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_stations_idtrip_foreign` (`IDTrip`),
  ADD KEY `trip_stations_idstation_foreign` (`IDStation`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trip_stations`
--
ALTER TABLE `trip_stations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_endstation_foreign` FOREIGN KEY (`endStation`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_idtrip_foreign` FOREIGN KEY (`IDTrip`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_startstation_foreign` FOREIGN KEY (`startStation`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_endstation_foreign` FOREIGN KEY (`endStation`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_idbus_foreign` FOREIGN KEY (`IDBus`) REFERENCES `buses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_startstation_foreign` FOREIGN KEY (`startStation`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trip_stations`
--
ALTER TABLE `trip_stations`
  ADD CONSTRAINT `trip_stations_idstation_foreign` FOREIGN KEY (`IDStation`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trip_stations_idtrip_foreign` FOREIGN KEY (`IDTrip`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
