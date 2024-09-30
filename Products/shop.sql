-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Sze 30. 08:47
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`Id`, `Name`, `Price`, `Date`) VALUES
(1, 'Apple iPhone 14', 999, '2024-01-01'),
(2, 'Samsung Galaxy S23', 899, '2024-01-02'),
(3, 'Sony WH-1000XM4', 349, '2024-01-03'),
(4, 'Dell XPS 13', 1299, '2024-01-04'),
(5, 'HP Spectre x360', 1399, '2024-01-05'),
(6, 'Bose QuietComfort 35', 299, '2024-01-06'),
(7, 'Apple MacBook Pro 16', 2399, '2024-01-07'),
(8, 'Microsoft Surface Pro 9', 899, '2024-01-08'),
(9, 'Google Pixel 7', 599, '2024-01-09'),
(10, 'Fitbit Charge 5', 149, '2024-01-10'),
(11, 'Nikon D3500', 499, '2024-01-11'),
(12, 'Canon EOS M50', 649, '2024-01-12'),
(13, 'Samsung QLED 65\"', 1799, '2024-01-13'),
(14, 'LG OLED 55\"', 1499, '2024-01-14'),
(15, 'Apple Watch Series 8', 399, '2024-01-15'),
(16, 'GoPro HERO10', 499, '2024-01-16'),
(17, 'JBL Flip 5', 89, '2024-01-17'),
(18, 'Anker PowerCore 20100', 39, '2024-01-18'),
(19, 'Logitech MX Master 3', 99, '2024-01-19'),
(20, 'Razer Huntsman Elite', 169, '2024-01-20'),
(21, 'Corsair K95 RGB', 199, '2024-01-21'),
(22, 'Samsung Galaxy Tab S8', 699, '2024-01-22'),
(23, 'Apple iPad Pro 11\"', 799, '2024-01-23'),
(24, 'Sony PlayStation 5', 499, '2024-01-24'),
(25, 'Xbox Series X', 499, '2024-01-25'),
(26, 'Nintendo Switch', 299, '2024-01-26'),
(27, 'Apple AirPods Pro', 249, '2024-01-27'),
(28, 'Samsung Galaxy Buds 2', 149, '2024-01-28'),
(29, 'Kindle Paperwhite', 139, '2024-01-29'),
(30, 'Oculus Quest 2', 299, '2024-01-30'),
(31, 'Roku Streaming Stick+', 49, '2024-01-31'),
(32, 'Amazon Fire TV Stick 4K', 49, '2024-02-01'),
(33, 'Nest Learning Thermostat', 249, '2024-02-02'),
(34, 'Ring Video Doorbell', 199, '2024-02-03'),
(35, 'Philips Hue White and Color', 199, '2024-02-04'),
(36, 'TP-Link Deco X20', 149, '2024-02-05'),
(37, 'Netgear Nighthawk Router', 199, '2024-02-06'),
(38, 'Apple HomePod Mini', 99, '2024-02-07'),
(39, 'Sonos One', 199, '2024-02-08'),
(40, 'Bose SoundLink Revolve+', 329, '2024-02-09'),
(41, 'Dyson V11 Vacuum', 599, '2024-02-10'),
(42, 'Roomba i7+', 799, '2024-02-11'),
(43, 'Instant Pot Duo 7-in-1', 99, '2024-02-12'),
(44, 'Ninja Foodi Grill', 199, '2024-02-13'),
(45, 'KitchenAid Stand Mixer', 379, '2024-02-14'),
(46, 'Cuisinart Air Fryer', 99, '2024-02-15'),
(47, 'YETI Rambler Tumbler', 29, '2024-02-16'),
(48, 'Hydro Flask Water Bottle', 39, '2024-02-17'),
(49, 'Ooni Pizza Oven', 299, '2024-02-18'),
(50, 'Traeger Pellet Grill', 599, '2024-02-19'),
(51, 'NordicTrack T Series Treadmill', 599, '2024-02-20'),
(52, 'Peloton Bike', 1499, '2024-02-21'),
(53, 'Bowflex Adjustable Dumbbells', 329, '2024-02-22'),
(54, 'Fitbit Versa 3', 229, '2024-02-23'),
(55, 'Bowflex Max Trainer', 999, '2024-02-24'),
(56, 'Under Armour HOVR Sneakers', 129, '2024-02-25'),
(57, 'Adidas Ultraboost', 179, '2024-02-26'),
(58, 'Nike Air Max', 159, '2024-02-27'),
(59, 'New Balance Fresh Foam', 139, '2024-02-28'),
(60, 'Columbia Rain Jacket', 89, '2024-02-29'),
(61, 'North Face Backpack', 129, '2024-03-01'),
(62, 'Patagonia Fleece Jacket', 149, '2024-03-02'),
(63, 'Reebok Yoga Mat', 29, '2024-03-03'),
(64, 'Rogue Fitness Kettlebell', 49, '2024-03-04'),
(65, 'Trek Mountain Bike', 499, '2024-03-05'),
(66, 'Gopro Hero9', 399, '2024-03-06'),
(67, 'Canon EOS Rebel T7', 499, '2024-03-07'),
(68, 'DJI Mavic Air 2', 799, '2024-03-08'),
(69, 'Bose Soundbar 700', 799, '2024-03-09'),
(70, 'LG Smart Refrigerator', 1999, '2024-03-10'),
(71, 'Samsung Front Load Washer', 799, '2024-03-11'),
(72, 'Whirlpool Dryer', 699, '2024-03-12'),
(73, 'Dyson Airwrap', 499, '2024-03-13'),
(74, 'Philips Sonicare Toothbrush', 99, '2024-03-14'),
(75, 'Conair Hair Dryer', 39, '2024-03-15'),
(76, 'Nespresso Coffee Maker', 199, '2024-03-16'),
(77, 'Keurig K-Elite', 129, '2024-03-17'),
(78, 'Breville Espresso Machine', 699, '2024-03-18'),
(79, 'KitchenAid Food Processor', 199, '2024-03-19'),
(80, 'Vitamix Blender', 399, '2024-03-20'),
(81, 'Oster Toaster Oven', 79, '2024-03-21'),
(82, 'Cuisinart Coffee Maker', 89, '2024-03-22'),
(83, 'Black+Decker Slow Cooker', 49, '2024-03-23'),
(84, 'Hamilton Beach Electric Kettle', 29, '2024-03-24'),
(85, 'Farberware Cookware Set', 129, '2024-03-25'),
(86, 'T-fal Nonstick Cookware', 89, '2024-03-26'),
(87, 'Crock-Pot 7-Quart', 49, '2024-03-27'),
(88, 'Rubbermaid Food Storage Containers', 39, '2024-03-28'),
(89, 'Bissell Carpet Cleaner', 299, '2024-03-29'),
(90, 'Shark Vacuum', 199, '2024-03-30'),
(91, 'DeLonghi Espresso Machine', 599, '2024-03-31'),
(92, 'Air Fryer Oven', 149, '2024-04-01'),
(93, 'Pressure Cooker', 99, '2024-04-02'),
(94, 'Coffee Grinder', 39, '2024-04-03'),
(95, 'Ice Cream Maker', 79, '2024-04-04'),
(96, 'Fondue Set', 49, '2024-04-05'),
(97, 'Sous Vide Precision Cooker', 89, '2024-04-06'),
(98, 'Meat Thermometer', 29, '2024-04-07'),
(99, 'Pasta Maker', 99, '2024-04-08'),
(100, 'Electric Griddle', 69, '2024-04-09');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
