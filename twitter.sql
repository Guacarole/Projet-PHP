-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 18 juin 2019 à 18:03
-- Version du serveur :  10.3.15-MariaDB
-- Version de PHP :  7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `twitter`
--

-- --------------------------------------------------------

--
-- Structure de la table `friends`
--

CREATE TABLE `friends` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `friend_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `created_at`, `updated_at`) VALUES
(21, 4, 2, '2019-06-17 11:51:39', '2019-06-17 11:51:39'),
(25, 4, 1, '2019-06-18 11:43:45', '2019-06-18 11:43:45'),
(26, 4, 3, '2019-06-18 12:12:50', '2019-06-18 12:12:50');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_06_15_083045_create_posts_table', 2),
(10, '2019_06_15_145842_create_friends_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'IMmyr1t65jadiIK2pOlnMJAeCduvJROE62MnXVHp', 'http://localhost', 1, 0, 0, '2019-06-14 19:12:56', '2019-06-14 19:12:56'),
(2, NULL, 'Laravel Password Grant Client', '0IEvOXuiEvdWzGebiar2NI2yzXDkyyakxmwCHfdU', 'http://localhost', 0, 1, 0, '2019-06-14 19:12:57', '2019-06-14 19:12:57');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-06-14 19:12:56', '2019-06-14 19:12:56');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, ':)', NULL, '2019-06-15 08:24:29', '2019-06-15 08:24:29'),
(2, 1, 'Hello Friends !', NULL, '2019-06-15 08:24:48', '2019-06-15 08:24:48'),
(3, 1, 'I love PeppaPig ! :D', NULL, '2019-06-15 09:11:42', '2019-06-15 09:11:42'),
(4, 1, 'test !', NULL, '2019-06-15 10:31:37', '2019-06-15 10:31:37'),
(5, 1, 'test', '{\"path\":\"C:\\\\xampp\\\\htdocs\\\\twitter\\\\public\\\\uploads\\/gKlcgcYtKGwKgwdZ.png\",\"type\":\"image\"}', '2019-06-15 10:37:25', '2019-06-15 10:37:25'),
(6, 1, 'test', '{\"path\":\"C:\\\\xampp\\\\htdocs\\\\twitter\\\\public\\\\uploads\\/MbxwzpTkvD1TqG92.png\",\"type\":\"image\"}', '2019-06-15 10:37:28', '2019-06-15 10:37:28'),
(7, 1, 'test !!', '{\"path\":\"post\\/LhZUlTYzSZGvX6VnY9mdgHwruB69u1ggCxyByGVM.jpeg\",\"type\":\"image\"}', '2019-06-15 10:42:45', '2019-06-15 10:42:45'),
(8, 1, 'test !!', '{\"path\":\"post\\/VfypUUCWojm9bay17XywkmcUYyLGtQ2N8BszRjfV.jpeg\",\"type\":\"image\"}', '2019-06-15 10:42:49', '2019-06-15 10:42:49'),
(9, 1, 'testttt', NULL, '2019-06-15 10:43:02', '2019-06-15 10:43:02'),
(11, 1, 'test encore', '{\"path\":\"post\\/t5ZVj3wMm4LSobauzU1biCF2LVk84NVZ1XrnnUVk.jpeg\",\"type\":\"image\"}', '2019-06-15 10:59:05', '2019-06-15 10:59:05'),
(12, 1, 'coucou', '{\"path\":\"post\\/T5n2tCGsiF0Rkj9FSV1LWnSpYvZuTNDplfkCImbU.jpeg\",\"type\":\"image\"}', '2019-06-15 11:25:55', '2019-06-15 11:25:55'),
(13, 1, 'Coucou', '{\"path\":\"post\\/wuU5iyJr0x74PUvYadXAuzGL1KwhkZiOBpCZb5TB.jpeg\",\"type\":\"image\"}', '2019-06-15 11:37:26', '2019-06-15 11:37:26'),
(14, 1, 'coucou toi', '{\"path\":\"post\\/2KKcVw4iXl6Jdh2NAQRX66c6vimst9ffovRmbdtJ.jpeg\",\"type\":\"image\"}', '2019-06-15 11:52:08', '2019-06-15 11:52:08'),
(15, 1, 'hi', '{\"path\":\"post\\/2SGEJso4E5bv15SLugvWgmwYZUdOdsx52DkzN1k1.jpeg\",\"type\":\"image\"}', '2019-06-15 12:00:26', '2019-06-15 12:00:26'),
(16, 1, 'hnuyhnu', '{\"path\":\"post\\/4ptjzbN4ckMaNoukdfzkznVOWozs6HOnU1FwH7m0.jpeg\",\"type\":\"image\"}', '2019-06-15 12:02:27', '2019-06-15 12:02:27'),
(17, 1, 'rsnhrs', '{\"path\":\"post\\/Syf6hz2EvFpn6EiJYN4z2dS1KLBKWBtrxhaBECMG.jpeg\",\"type\":\"image\"}', '2019-06-15 12:10:31', '2019-06-15 12:10:31'),
(18, 1, 'jshrgsg', '{\"path\":\".\\/post\\/kJAORoMG0BfmML88itz2pfD1dVOGNboWYMkQ07gj.jpeg\",\"type\":\"image\"}', '2019-06-15 12:16:10', '2019-06-15 12:16:10'),
(19, 1, 'rjehrgtd', '{\"path\":\".\\/.\\/.\\/.\\/storage\\/app\\/public\\/post\\/NiANHdNFRGLfOUK6kC91JESw0zI1rfElAojzkogB.jpeg\",\"type\":\"image\"}', '2019-06-15 12:18:22', '2019-06-15 12:18:22'),
(20, 1, ',snjdfxrsh', '{\"path\":\".\\/.\\/.\\/.\\/storage\\/app\\/public\\/post\\/YwSJ1LVqUrtguLIsDITH33q09VgExW0wn9fhqsC6.jpeg\",\"type\":\"image\"}', '2019-06-15 12:20:02', '2019-06-15 12:20:02'),
(21, 1, ',snjdfxrsh', '{\"path\":\".\\/.\\/.\\/.\\/storage\\/app\\/public\\/post\\/lhNx8aTkVqax9Q1cnKNbSTtObUc407BDQv642Swj.jpeg\",\"type\":\"image\"}', '2019-06-15 12:20:05', '2019-06-15 12:20:05'),
(22, 1, 'coucou', '{\"path\":\"post\\/BL23pFkE1qrpkutsz8M57o12FHI8V1LDnU7IUkIu.jpeg\",\"type\":\"image\"}', '2019-06-15 12:37:44', '2019-06-15 12:37:44'),
(23, 1, 'hello lol', '{\"path\":\".\\/.\\/.\\/.\\/storage\\/app\\/public\\/post\\/AGAGvVzKnj0SH33vLBXBY58tf5oB1Cpo3ocQ2yoU.jpeg\",\"type\":\"image\"}', '2019-06-15 12:41:07', '2019-06-15 12:41:07'),
(24, 1, 'heyyyyy', '{\"path\":\"post\\/gGIinATKky590SXPqdSiqwgAm54j4FgL89j8JIA3.jpeg\",\"type\":\"image\"}', '2019-06-15 12:47:38', '2019-06-15 12:47:38'),
(25, 1, 'heyyyyy', '{\"path\":\"post\\/Nz9osij52JWKPvJyOwlPgaxR5ad1oZUeP7Oy87qi.jpeg\",\"type\":\"image\"}', '2019-06-15 12:50:58', '2019-06-15 12:50:58'),
(26, 3, 'coucou coucou', NULL, '2019-06-15 14:28:09', '2019-06-15 14:28:09'),
(27, 4, 'Coucou c\'est moi', NULL, '2019-06-16 06:43:08', '2019-06-16 06:43:08'),
(28, 4, 'Como estas :)', NULL, '2019-06-16 06:43:17', '2019-06-16 06:43:17'),
(29, 4, 'yo', NULL, '2019-06-16 07:18:14', '2019-06-16 07:18:14'),
(30, 4, 'znoigrv', NULL, '2019-06-16 11:29:57', '2019-06-16 11:29:57'),
(31, 4, 'ergz', NULL, '2019-06-16 12:36:08', '2019-06-16 12:36:08'),
(32, 4, 'brzgz', NULL, '2019-06-16 12:36:17', '2019-06-16 12:36:17'),
(33, 4, 'gzrhz', NULL, '2019-06-16 12:43:07', '2019-06-16 12:43:07'),
(34, 4, 'bsvqg', NULL, '2019-06-16 13:01:41', '2019-06-16 13:01:41'),
(35, 4, 'kftjytfku', NULL, '2019-06-16 13:29:37', '2019-06-16 13:29:37'),
(36, 4, 'kftjytfku', NULL, '2019-06-16 13:29:42', '2019-06-16 13:29:42'),
(37, 4, 'kftjytfku', NULL, '2019-06-16 13:29:42', '2019-06-16 13:29:42'),
(38, 4, 'jhii', NULL, '2019-06-16 13:32:20', '2019-06-16 13:32:20'),
(39, 4, 'ghj', NULL, '2019-06-16 13:44:50', '2019-06-16 13:44:50'),
(40, 4, 'ghj', NULL, '2019-06-16 13:44:51', '2019-06-16 13:44:51'),
(41, 4, 'ghj', NULL, '2019-06-16 13:44:52', '2019-06-16 13:44:52'),
(42, 4, 'ldskjbgqdsfhigbeflidgbjn', NULL, '2019-06-17 10:31:35', '2019-06-17 10:31:35'),
(43, 4, 'REGARDEZ ICI', NULL, '2019-06-17 10:33:10', '2019-06-17 10:33:10'),
(44, 4, 'sdsfvsdfds', NULL, '2019-06-17 10:35:56', '2019-06-17 10:35:56'),
(45, 4, 'sdsfvsdfds', NULL, '2019-06-17 10:35:58', '2019-06-17 10:35:58'),
(46, 4, 'sdsfvsdfds', NULL, '2019-06-17 10:36:14', '2019-06-17 10:36:14'),
(47, 4, 'hytjtyjtyktykykkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', NULL, '2019-06-17 11:34:06', '2019-06-17 11:34:06'),
(48, 4, 'cvhfghfgh', NULL, '2019-06-17 11:42:41', '2019-06-17 11:42:41'),
(49, 5, 'Coucou les gars !!!', NULL, '2019-06-18 09:18:39', '2019-06-18 09:18:39');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'carole', 'carole.granger@etu.uca.fr', '$2y$10$ea2ZDxY2f8Q0ngSPPtQsEOzzwMbamO.lP3LJ0RLkpTPnQTPg58ipq', 'XbnhdDbXydrme1Qd550p3WP2v0uy6WZJ4bYMColfNgBUshm4zzsiYMf3EoMz', '2019-06-14 19:19:33', '2019-06-14 19:19:33'),
(2, 'carole', 'antoine.leb@hotmail.com', '$2y$10$RfB1PCwApHf.e36xUJ9aGeZGbAoes.Rh9c6XeJzd/M4AY7DfBaH.S', 'PcJ8B9tXPdebQDETcV4EwdZ9WlJYNpoXvEHlNghJs6GIlSOAhrD2yaJM8bwE', '2019-06-15 11:09:21', '2019-06-15 11:09:21'),
(3, 'coucou', 'coucou@coucou.com', '$2y$10$nBkY2mE7QienKn5GOyGXFuiUI5LNY9Uxd3BW8/4kyiEfSnLtz4XfS', NULL, '2019-06-15 14:27:45', '2019-06-15 14:27:45'),
(4, 'Claire', 'claire@claire.com', '$2y$10$p.WLzlQnMX.arc8bMDMnouSuKWukBfiyTBq3hEyhoCb2DuovSFSMG', 'biF0OqfDNM0O2MK7M6l5p5fbtGWYWqOoj8XlxaivBYCEUvMV11vTNyxmFfpF', '2019-06-16 06:42:54', '2019-06-16 06:42:54'),
(5, 'Hello', 'a@a.com', '$2y$10$OvfHm8a09frEVEmj7fnxlOH4BvaUMhOyelEMZUOgqs35rsrUoJ7ni', NULL, '2019-06-18 09:18:31', '2019-06-18 09:18:31');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friends_user_id_index` (`user_id`),
  ADD KEY `friends_friend_id_index` (`friend_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Index pour la table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_index` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
