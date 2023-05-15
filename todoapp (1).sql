-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 11:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todoapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cookbooks`
--

CREATE TABLE `cookbooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `saved_recipes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`saved_recipes`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookbooks`
--

INSERT INTO `cookbooks` (`id`, `user_id`, `saved_recipes`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\",\"2\"]', '2023-05-13 16:12:15', '2023-05-13 16:12:32'),
(2, 3, '[\"2\"]', '2023-05-14 04:13:49', '2023-05-14 04:13:49'),
(3, 2, '[\"1\",\"3\",\"5\",\"4\",\"2\"]', '2023-05-14 05:40:32', '2023-05-14 06:29:50'),
(4, 4, '[\"1\"]', '2023-05-14 05:42:53', '2023-05-14 05:42:53'),
(5, 5, '[\"2\",\"3\",\"6\"]', '2023-05-14 09:04:50', '2023-05-14 09:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `list_id` int(11) NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE `lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_04_17_083118_create_lists_table', 1),
(3, '2023_04_17_172039_create_items_table', 1),
(4, '2023_05_07_062701_test', 1),
(5, '2023_05_13_094051_users', 1),
(6, '2023_05_13_175052_cook_books', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `likes` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `ingredients` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `title`, `author`, `likes`, `description`, `image_url`, `ingredients`, `created_at`, `updated_at`) VALUES
(1, 'test', 'Nelson Mwangi', 2, 'cdcdcdc', 'https://firebasestorage.googleapis.com/v0/b/recette-cd6aa.appspot.com/o/recipeImages%2Fugali.jpg?alt=media&token=825443aa-be21-4efd-856d-b0d049aee238', 'cdcd', '2023-05-13 15:19:09', '2023-05-14 05:42:53'),
(2, 'Ugali', 'Nelson Mwangi', 2, 'Boil water for 5 minutes. Add the flour gradually as you stir to amalgamate the flour into a thick cake. Flip once the ugali becomes thick to your liking. Serve with some stew or veggies(Your option) while still hot.', 'https://firebasestorage.googleapis.com/v0/b/recette-cd6aa.appspot.com/o/recipeImages%2Fugali.jpg?alt=media&token=1a81091b-693f-427a-8644-2bb22282500e', 'water|corn flour|stew', '2023-05-14 04:04:21', '2023-05-14 09:04:50'),
(3, 'Ellen\'s Beef Stew', 'Nelson Kamau', 2, 'Combine flour, pepper, and salt in bag. Add meat and shake til coated. Heat oil in Dutch oven. Brown meat on all sides. Add onion, garlic, water, tomatoes, salt, and worcestershire. Cover, reduce heat to low and simmer 2 hours, until meat begins to get tender. Add potatoes, onions, and carrots. Cook 30-45 mins, until vegetables are done. Add peas. Cook until heated.', 'https://firebasestorage.googleapis.com/v0/b/recette-cd6aa.appspot.com/o/recipeImages%2Fellen\'s%20beef.jpg?alt=media&token=d9b15b91-0faf-4d37-81cc-22ff2b05cf91', '1 3/4 lb chuck; or round, cubed|1/3 c flour|1/4 ts pepper|1/2 ts salt|3 tb oil|1/2 onion; chopped|1 cl garlic; minced|2 3/4 c boiling water|28 oz tomatoes; canned|1/2 ts worcestershire|1 pn basil|1 pn dill|1 pn thyme|4 md potatoes; quartered|2 onions; quartered|1 lb carrots; 2 inch pieces|1 c peas', '2023-05-14 06:22:51', '2023-05-14 09:06:08'),
(4, 'Negroni Cocktails', 'Nelson Kamau', 1, 'Place a dozen ice cubes in a tall pitcher. Add the gin, vermouth, and Campari. Stir and chill. Serve over ice in Old-Fashioned glasses; garnish with twists of lemon peel. AMBROSINO\'S NORTH SCOTTSDALE RD., SCOTTSDALE', 'https://firebasestorage.googleapis.com/v0/b/recette-cd6aa.appspot.com/o/recipeImages%2FNegroni%20Cocktails.jpg?alt=media&token=b3936c8e-db6f-4e84-9db6-ae1d6c7c35e4', '1 c gin|1 c sweet italian vermouth|1 c campari|6 lemon-peel twists', '2023-05-14 06:25:12', '2023-05-14 06:29:43'),
(5, 'Goat Cheese Burgers', 'Nelson Kamau', 1, 'Combine beef with crumbs, lemon juice, lemon zest, thyme, salt and pepper. Mix well. Form into 12 thin (4\\\" diameter) patties. Place 1 tablespoon goat cheese atop 6 of the beef patties. Top each with remaining 6 patties. Seal at edges to enclose cheese. Grill until cooked through, about 5 minutes per side, or until desired doneness. Serve with buns and red pepper relish. Yield: 6 servings.', 'https://firebasestorage.googleapis.com/v0/b/recette-cd6aa.appspot.com/o/recipeImages%2FGoat%20Cheese%20Burgers.jpg?alt=media&token=bcf63244-a2e8-4a98-bcc7-60292b764c5c', '1 1/2 lb lean ground beef|1/2 c fresh breadcrumbs|2 tb fresh lemon juice|2 ts lemon zest|2 ts thyme|1 ts salt|1/2 ts pepper|6 tb soft; fresh goat cheese|hamburger buns|red pepper relish', '2023-05-14 06:29:26', '2023-05-14 06:29:39'),
(6, 'Grandpa\'s Homemade Noodles', 'James Brian', 1, 'Mix dry ingredients into liquid by hand. Do not overmix, as it tends to toughen noodles. Use flour sparingly when rolling out dough. Roll out to 1/4 inch thickness and use pizza cutter for cutting noodles. Per serving: 278 Calories (kcal); 6g Total Fat; (20% calories from fat); 7g Protein; 48g Carbohydrate; 16mg Cholesterol; 593mg Sodium Food Exchanges: 3 Grain(Starch); 0 Lean Meat; 0 Vegetable; 0 Fruit; 1 Fat; 0 Other Carbohydrates', 'https://firebasestorage.googleapis.com/v0/b/recette-cd6aa.appspot.com/o/recipeImages%2Forijit-chatterjee-wEBg_pYtynw-unsplash.jpg?alt=media&token=9f553e43-f1cf-478d-8aa2-d913d4ea246e', '2 c flour|2 beaten eggs|2 tb water|2 tb butter or margarine|2 ts bouillon|1 shake pepper|1 ts salt', '2023-05-14 09:11:44', '2023-05-14 09:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Freddie Mercury', 'freddiemerc@gmail.com', '$2y$10$.hzhYlL1Gl0HCT0TZYq2n.f16.LQhoorJ22LBFrqNihchDtznyGWe', '2023-05-13 15:23:13', '2023-05-13 15:23:13'),
(2, 'Nelson Kamau', 'nelsonkamau@gmail.com', '$2y$10$fWDycDZrnPUzlq13czCVWuCWXGZbyqghFhcpZuvapLw0JgkrzUEYu', '2023-05-14 04:11:25', '2023-05-14 04:11:25'),
(3, 'Play Carti', 'pcarti@gmail.com', '$2y$10$xX3Ji9DcolHDz9hKdjyxH.muQILFWe6bGvRKEdBtW3YHZIF0G1vAK', '2023-05-14 04:13:38', '2023-05-14 04:13:38'),
(4, 'Test User', 'test@gmail.com', '$2y$10$.GuKHqVx4xZqiQZsFlazbuhHvkr0XrymwIFBfvnQQmJyXJQrsOJum', '2023-05-14 05:42:16', '2023-05-14 05:42:16'),
(5, 'James Brian', 'jb@gmail.com', '$2y$10$XWZfk7Zxn7osw8mxaHz2qO2lX7h/uX8395wWUsEzOLpoCMh/V6MXq', '2023-05-14 09:04:00', '2023-05-14 09:04:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cookbooks`
--
ALTER TABLE `cookbooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cookbooks_user_id_foreign` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cookbooks`
--
ALTER TABLE `cookbooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cookbooks`
--
ALTER TABLE `cookbooks`
  ADD CONSTRAINT `cookbooks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
