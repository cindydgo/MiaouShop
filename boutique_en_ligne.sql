-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 28 avr. 2025 à 07:02
-- Version du serveur : 11.7.1-MariaDB-deb12
-- Version de PHP : 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutique_en_ligne`
--

-- --------------------------------------------------------

--
-- Structure de la table `billing_address`
--

CREATE TABLE `billing_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_fk` int(10) UNSIGNED NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `brand_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `logo`, `brand_description`) VALUES
(1, 'NVIDIA', 'https://upload.wikimedia.org/wikipedia/fr/thumb/4/47/Nvidia_%28logo%29.svg/2560px-Nvidia_%28logo%29.svg.png', 'Leader dans les cartes graphiques, particulièrement pour le gaming et les applications professionnelles.'),
(2, 'AMD', 'https://upload.wikimedia.org/wikipedia/commons/6/6a/AMD_Logo.png', 'Connu pour ses cartes graphiques et processeurs compétitifs.'),
(3, 'Intel', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Intel-logo-2022.png/1280px-Intel-logo-2022.png', 'Leader historique des processeurs, connu pour ses performances et sa technologie de pointe.'),
(4, 'AMD', 'https://upload.wikimedia.org/wikipedia/commons/6/6a/AMD_Logo.png', 'Marque spécialisée dans les processeurs haute performance.'),
(5, 'Corsair', 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Corsairlogo_new.png', 'Fabricant reconnu de RAM haute performance et d\'accessoires gaming.'),
(6, 'Kingston', 'https://logo-marque.com/wp-content/uploads/2020/12/Kingston-Technology-Logo.png', 'Une marque de confiance pour la RAM et les solutions de stockage.'),
(7, 'Seagate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Seagate_logo.svg/2560px-Seagate_logo.svg.png', 'Spécialiste des disques durs et des solutions de stockage.'),
(8, 'Western Digital', 'https://pnghunter.com/get-logo.php?id=4003', 'Célèbre pour ses disques durs et SSD fiables.'),
(9, 'Corsair', 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Corsairlogo_new.png', 'Marque célèbre pour ses alimentations et composants gaming.'),
(10, 'Seasonic', 'https://upload.wikimedia.org/wikipedia/commons/e/e0/Seasonic-logo-w-o-www.png', 'Marque fiable et reconnue pour ses alimentations de qualité.'),
(11, 'Cooler Master', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Cooler_Master_Logo.svg/1200px-Cooler_Master_Logo.svg.png', 'Fabricant d\'accessoires informatiques, spécialisé dans les refroidissements.'),
(12, 'Noctua', 'https://upload.wikimedia.org/wikipedia/fr/6/6e/Noctua_logo.jpg', 'Reconnue pour ses solutions de refroidissement ultra-silencieuses.'),
(13, 'Arctic', 'https://upload.wikimedia.org/wikipedia/commons/9/92/Arctic_logo.svg', 'Marque réputée pour ses solutions thermiques et de refroidissement.'),
(14, 'Thermal Grizzly', 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Thermal_Grizzly_logo.svg', 'Spécialiste dans les pâtes thermiques de haute performance.'),
(15, 'Asus', 'https://static.vecteezy.com/system/resources/previews/019/767/925/non_2x/asus-logo-asus-icon-transparent-free-png.png', 'Fabricant leader de cartes mères, notamment pour les joueurs.'),
(16, 'MSI', 'https://logo-marque.com/wp-content/uploads/2020/11/MSI-Logo.png', 'Marque reconnue pour ses cartes mères de haute qualité.');

-- --------------------------------------------------------

--
-- Structure de la table `custom_models`
--

CREATE TABLE `custom_models` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand_fk` int(11) NOT NULL,
  `generation_fk` int(11) NOT NULL,
  `product_range_fk` int(11) NOT NULL,
  `product_component_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_component_item_fk` int(11) NOT NULL,
  `user_fk` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `favorite`
--

INSERT INTO `favorite` (`id`, `product_component_item_fk`, `user_fk`) VALUES
(5, 7, 1),
(6, 8, 1),
(7, 5, 1),
(8, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `generations`
--

CREATE TABLE `generations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand_fk` int(11) NOT NULL,
  `product_component_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `generations`
--

INSERT INTO `generations` (`id`, `name`, `brand_fk`, `product_component_fk`) VALUES
(1, 'RTX 30 Series', 1, 1),
(2, 'RTX 20 Series', 1, 1),
(3, 'GTX 10 Series', 1, 1),
(4, 'Radeon RX 6000 Series', 2, 1),
(5, 'Radeon RX Vega', 2, 1),
(6, 'Core i9 13th Gen', 3, 2),
(7, 'Core i7 12th Gen', 3, 2),
(8, 'Ryzen 5000 Series', 4, 2),
(9, 'Ryzen 3000 Series', 4, 2),
(10, 'Vengeance LPX', 5, 3),
(11, 'Vengeance RGB Pro', 5, 3),
(12, 'HyperX Predator', 6, 3),
(13, 'HyperX Fury', 6, 3),
(14, 'Barracuda 120', 7, 4),
(15, 'FireCuda 530', 7, 4),
(16, 'WD Blue SN550', 8, 4),
(17, 'WD Black SN850', 8, 4),
(18, 'RMx Series', 5, 5),
(19, 'HX Series', 5, 5),
(20, 'Focus GX', 9, 5),
(21, 'Prime TX', 9, 5),
(22, 'Hyper 212 Evo', 10, 6),
(23, 'MasterLiquid ML240L', 10, 6),
(24, 'NH-D15', 11, 6),
(25, 'NH-U12S', 11, 6),
(26, 'MX-4', 12, 7),
(27, 'MX-2', 12, 7),
(28, 'Kryonaut', 13, 7),
(29, 'Aeronaut', 13, 7),
(30, 'ROG Strix B550-F', 14, 8),
(31, 'TUF Gaming Z590', 14, 8),
(32, 'MAG B550 TOMAHAWK', 15, 8),
(33, 'MEG Z490 GODLIKE', 15, 8);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_fk` int(10) UNSIGNED NOT NULL,
  `product_component_item_fk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_components`
--

CREATE TABLE `product_components` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_type_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_components`
--

INSERT INTO `product_components` (`id`, `name`, `product_type_fk`) VALUES
(1, 'Carte Graphique', 1),
(2, 'Processeur', 1),
(3, 'RAM', 1),
(4, 'Disque de stockage', 1),
(5, 'Alimentation', 1),
(6, 'Ventirad', 1),
(7, 'Pâte Thermique', 1),
(8, 'Carte mère', 1);

-- --------------------------------------------------------

--
-- Structure de la table `product_component_items`
--

CREATE TABLE `product_component_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_component_fk` int(11) NOT NULL,
  `brand_fk` int(11) NOT NULL,
  `custom_model_fk` int(11) DEFAULT NULL,
  `generation_fk` int(11) DEFAULT NULL,
  `product_range_fk` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_component_items`
--

INSERT INTO `product_component_items` (`id`, `name`, `price`, `product_component_fk`, `brand_fk`, `custom_model_fk`, `generation_fk`, `product_range_fk`, `description`, `image`) VALUES
(1, 'RTX 3050', 259.99, 1, 1, NULL, 2, 1, '8 Go GDDR6, 2560 cœurs CUDA, fréquence boost jusqu’à 1777 MHz', 'https://media.topachat.com/media/s400/6570a28990cc9019807a0a31.webp'),
(2, 'RTX 3060', 349.99, 1, 1, NULL, 2, 2, '12 Go GDDR6, 3584 cœurs CUDA, fréquence boost jusqu’à 1777 MHz', 'https://media.topachat.com/media/s400/63208dbed4ceb9226e13ba88.webp'),
(3, 'RTX 3070', 499.99, 1, 1, NULL, 2, 3, '8 Go GDDR6, 5888 cœurs CUDA, fréquence boost jusqu’à 1730 MHz', 'https://m.media-amazon.com/images/I/61+aEAi70wS._AC_SL1000_.jpg'),
(4, 'RTX 3080', 699.99, 1, 1, NULL, 2, 4, '10 Go GDDR6X, 8704 cœurs CUDA, fréquence boost jusqu’à 1710 MHz', 'https://i.ebayimg.com/images/g/J0gAAOSwrFtn3wWi/s-l1600.webp'),
(5, 'RTX 3090', 1499.99, 1, 1, NULL, 2, 5, '24 Go GDDR6X, 10496 cœurs CUDA, fréquence boost jusqu’à 1695 MHz', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRxBX3TaE3qDFQnOHGFLIy4GPcNWzYqtEiHjIWFzlNntmChCkp5lPuzhMDZE9cvqVhIsOXFykNZepXad4OzecvaZHk7OUfxiYG3pjkNEIaoZZ_YzO4uZ0DazQ'),
(6, 'i9-13900K', 799.99, 2, 2, NULL, 7, 6, '24 cœurs (8P+16E fréquence boost jusqu’à 5.8 GHz, 36 Mo cache L3', 'https://css.productcaster.com/_next/image?url=https%3A%2F%2Fpmcdn.priceminister.com%2Fphoto%2F4671332830_L.jpg&w=384&q=75'),
(7, 'i9-13900KF', 779.99, 2, 2, NULL, 7, 7, 'Sans iGPU, même specs que le 13900K, boost 5.8 GHz', 'https://css.productcaster.com/_next/image?url=https%3A%2F%2Fpmcdn.priceminister.com%2Fphoto%2F4671332830_L.jpg&w=384&q=75'),
(8, 'i7-12700K', 469.99, 2, 2, NULL, 8, 8, '12 cœurs (8P+4E fréquence boost jusqu’à 5.0 GHz, 25 Mo cache L3', 'https://media.ldlc.com/r374/ld/products/00/05/90/01/LD0005900192_1.jpg'),
(9, 'i7-12700KF', 449.99, 2, 2, NULL, 8, 9, 'Sans iGPU, identique au 12700K, boost 5.0 GHz', 'https://media.ldlc.com/r374/ld/products/00/05/90/01/LD0005900192_1.jpg'),
(10, 'Ryzen 9 5950X', 799.99, 3, 2, NULL, 9, 10, '16 cœurs / 32 threads, fréquence boost jusqu’à 4.9 GHz, 72 Mo cache', 'https://m.media-amazon.com/images/I/61ISSSA+x+L._AC_SL1280_.jpg'),
(11, 'Ryzen 7 5800X', 439.99, 3, 2, NULL, 9, 11, '8 cœurs / 16 threads, fréquence boost jusqu’à 4.7 GHz, 36 Mo cache', 'https://www.cdiscount.com/pdt2/w/o/f/1/700x700/100000063wof/rw/processeur-amd-ryzen-7-5800x-am4-4-70-ghz-8.jpg'),
(12, 'Ryzen 5 5600X', 299.99, 3, 2, NULL, 9, 12, '6 cœurs / 12 threads, fréquence boost jusqu’à 4.6 GHz, 35 Mo cache', 'https://m.media-amazon.com/images/I/517vY9awQdL._AC_SL1200_.jpg'),
(13, 'Ryzen 9 3900X', 569.99, 3, 2, NULL, 10, 13, '12 cœurs / 24 threads, fréquence boost jusqu’à 4.6 GHz, 70 Mo cache', 'https://media.ldlc.com/r1600/ld/products/00/05/35/94/LD0005359451_2.jpg'),
(14, 'Ryzen 7 3700X', 319.99, 3, 2, NULL, 10, 14, '8 cœurs / 16 threads, fréquence boost jusqu’à 4.4 GHz, 36 Mo cache', 'https://media.materiel.net/r550/products/MN0005368670_1.jpg'),
(15, 'Ryzen 5 3600', 199.99, 3, 2, NULL, 10, 15, '6 cœurs / 12 threads, fréquence boost jusqu’à 4.2 GHz, 35 Mo cache', 'https://media.ldlc.com/r1600/ld/products/00/05/36/84/LD0005368478_2.jpg'),
(16, 'ROG Strix B550‑F Gaming', 189.99, 8, 14, NULL, 30, 16, 'Socket AM4, chipset B550, format ATX, 4× DDR4 (jusqu’à 128 Go), PCIe 4.0', 'https://dlcdnwebimgs.asus.com/gain/803CCAEB-848C-416A-A24C-B107B9575134/w717/h525'),
(17, 'ROG Strix B550‑F Gaming WiFi', 209.99, 8, 14, NULL, 30, 17, 'Même carte avec module Wi‑Fi 6 intégré et Bluetooth 5.1', 'https://cdn.idealo.com/folder/Product/201718/7/201718783/s4_produktbild_max/asus-rog-strix-b550-f-gaming-wifi-ii.jpg'),
(18, 'TUF Gaming Z590‑Plus', 199.99, 8, 14, NULL, 31, 18, 'Socket LGA1200, chipset Z590, format ATX, support DDR4 jusqu’à 128 Go, LAN 2.5 Gb', 'https://media.ldlc.com/r374/ld/products/00/05/78/35/LD0005783568_1.jpg'),
(19, 'TUF Gaming Z590‑Plus WiFi 6E', 229.99, 8, 14, NULL, 31, 19, 'Comme le Z590‑Plus, avec Wi‑Fi 6E et Bluetooth 5.2', 'https://m.media-amazon.com/images/I/71+nBnRQNSS._AC_SL1500_.jpg'),
(20, 'MAG B550 TOMAHAWK Max', 179.99, 8, 15, NULL, 32, 20, 'Socket AM4, chipset B550, ATX, 4× DDR4 (128 Go), 2× M.2, LAN 2.5 Gb', 'https://m.media-amazon.com/images/I/81LeNxQOZ8L._AC_SL1500_.jpg'),
(21, 'MAG B550 TOMAHAWK WiFi', 199.99, 8, 15, NULL, 32, 21, 'Version avec module Wi‑Fi 6 et Bluetooth 5.1', 'https://m.media-amazon.com/images/I/61hPyxPlRjL._AC_SL1200_.jpg'),
(22, 'MEG Z490 GODLIKE', 799.99, 8, 15, NULL, 33, 22, 'Socket LGA1200, chipset Z490, format E‑ATX, 4× DDR4, 3× M.2, LAN 10 Gb + 2.5 Gb', 'https://m.media-amazon.com/images/I/61m12l7E+GL._AC_SL1000_.jpg'),
(23, 'MEG Z490 GODLIKE Carbon', 849.99, 8, 15, NULL, 33, 23, 'Édition spéciale avec dissipateur renforcé, RGB étendu et refroidissement actif', 'https://m.media-amazon.com/images/I/61g+rl0poXL._AC_SL1000_.jpg'),
(24, 'Vengeance LPX 16GB (2×8GB) DDR4‑3200 C16', 79.99, 3, 5, NULL, 10, 24, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36', 'https://m.media-amazon.com/images/I/51OAieKsYEL._AC_SL1100_.jpg'),
(25, 'Vengeance LPX 32GB (2×16GB) DDR4‑3200 C16', 149.99, 3, 5, NULL, 10, 25, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36', 'https://m.media-amazon.com/images/I/61wCOVcyvFL._AC_SL1500_.jpg'),
(26, 'Vengeance RGB Pro 16GB (2×8GB) DDR4‑3600 C18', 89.99, 3, 5, NULL, 11, 26, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑3600 MHz, timings 18‑22‑22‑42, éclairage RGB', 'https://m.media-amazon.com/images/I/81cGtM0c+UL._AC_SL1500_.jpg'),
(27, 'Vengeance RGB Pro 32GB (2×16GB) DDR4‑3600 C18', 169.99, 3, 5, NULL, 11, 27, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑3600 MHz, timings 18‑22‑22‑42, éclairage RGB', 'https://m.media-amazon.com/images/I/81cGtM0c+UL._AC_SL1500_.jpg'),
(28, 'HyperX Predator 16GB (2×8GB) DDR4‑3200 C16', 84.99, 3, 6, NULL, 12, 28, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36', 'https://m.media-amazon.com/images/I/71Y-MK6-fsL._AC_SL1500_.jpg'),
(29, 'HyperX Predator 32GB (2×16GB) DDR4‑3200 C16', 159.99, 3, 6, NULL, 12, 29, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36', 'https://m.media-amazon.com/images/I/71Y-MK6-fsL._AC_SL1500_.jpg'),
(30, 'HyperX Fury 16GB (2×8GB) DDR4‑2666 C16', 74.99, 3, 6, NULL, 13, 30, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑2666 MHz, timings 16‑18‑18', 'https://m.media-amazon.com/images/I/61uXihcspuL._AC_SL1500_.jpg'),
(31, 'HyperX Fury 32GB (2×16GB) DDR4‑2666 C16', 139.99, 3, 6, NULL, 13, 31, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑2666 MHz, timings 16‑18‑18', 'https://m.media-amazon.com/images/I/61uXihcspuL._AC_SL1500_.jpg'),
(32, 'Corsair RM750x', 129.99, 5, 5, NULL, 18, 32, '750W, 80+ Gold, full modulaire, ventilateur à roulement hydrodynamique', 'https://m.media-amazon.com/images/I/71XeKGayJaL._AC_SL1500_.jpg'),
(33, 'Corsair RM850x', 149.99, 5, 5, NULL, 18, 33, '850W, 80+ Gold, full modulaire, ventilateur à roulement hydrodynamique', 'https://m.media-amazon.com/images/I/812GLY781vL._AC_SL1500_.jpg'),
(34, 'Corsair HX1000i', 259.99, 5, 5, NULL, 19, 34, '1000W, 80+ Platinum, full modulaire, contrôle digital via iCUE', 'https://m.media-amazon.com/images/I/71G+PGgT1fL._AC_SL1500_.jpg'),
(35, 'Corsair HX1200i', 289.99, 5, 5, NULL, 19, 35, '1200W, 80+ Platinum, full modulaire, contrôle digital via iCUE', 'https://m.media-amazon.com/images/I/61p2oIuPU-L._AC_SL1200_.jpg'),
(36, 'Seasonic Focus GX-650', 109.99, 5, 9, NULL, 20, 36, '650W, 80+ Gold, full modulaire, compact SFX‑L compatible', 'https://m.media-amazon.com/images/I/91EVLB4ProL._AC_SL1500_.jpg'),
(37, 'Seasonic Focus GX-750', 129.99, 5, 9, NULL, 20, 37, '750W, 80+ Gold, full modulaire, compact SFX‑L compatible', 'https://www.grosbill.com/images_produits/5548acad-e4cd-4e42-90c2-185a5febae68.jpg'),
(38, 'Seasonic Prime TX-850', 189.99, 5, 9, NULL, 21, 38, '850W, 80+ Titanium, full modulaire, condensateurs japonaises', 'https://www.grosbill.com/images_produits/d1b091b7-f915-44ef-a227-3e251a47fe34.jpg'),
(39, 'Seasonic Prime TX-1000', 219.99, 5, 9, NULL, 21, 39, '1000W, 80+ Titanium, full modulaire, condensateurs japonaises', 'https://www.grosbill.com/images_produits/3302286a-635c-4cff-852d-da94b9c7e522.jpg'),
(40, 'Barracuda 120 1 To', 49.99, 4, 7, NULL, 14, 40, 'Disque dur 3,5″ SATA III, 1 To, 7200 tr/min, cache 64 Mo', 'https://m.media-amazon.com/images/I/310rvg5H1BL._SL500_.jpg?format=auto&width=640&height=auto&quality=50'),
(41, 'Barracuda 120 2 To', 69.99, 4, 7, NULL, 14, 41, 'Disque dur 3,5″ SATA III, 2 To, 7200 tr/min, cache 64 Mo', 'https://m.media-amazon.com/images/I/71NyznvXLOL._AC_SL1500_.jpg'),
(42, 'FireCuda 530 500 Go', 129.99, 4, 7, NULL, 15, 42, 'SSD NVMe M.2 2280 PCIe 4.0, 500 Go, jusqu’à 7 300 Mo/s en lecture', 'https://m.media-amazon.com/images/I/51lrFzSnxhL._AC_SL1080_.jpg'),
(43, 'FireCuda 530 1 To', 249.99, 4, 7, NULL, 15, 43, 'SSD NVMe M.2 2280 PCIe 4.0, 1 To, jusqu’à 7 300 Mo/s en lecture', 'https://m.media-amazon.com/images/I/51lrFzSnxhL._AC_SL1080_.jpg'),
(44, 'WD Blue SN550 500 Go', 59.99, 4, 8, NULL, 16, 44, 'SSD NVMe M.2 2280 PCIe 3.0, 500 Go, jusqu’à 2 400 Mo/s en lecture', 'https://m.media-amazon.com/images/I/61tANhen+JL._AC_SL1500_.jpg'),
(45, 'WD Blue SN550 1 To', 109.99, 4, 8, NULL, 16, 45, 'SSD NVMe M.2 2280 PCIe 3.0, 1 To, jusqu’à 2 400 Mo/s en lecture', 'https://m.media-amazon.com/images/I/61tANhen+JL._AC_SL1500_.jpg'),
(46, 'WD Black SN850 500 Go', 149.99, 4, 8, NULL, 17, 46, 'SSD NVMe M.2 2280 PCIe 4.0, 500 Go, jusqu’à 7 000 Mo/s en lecture', 'https://m.media-amazon.com/images/I/71Sr1zjPhwL._AC_SL1500_.jpg'),
(47, 'WD Black SN850 1 To', 299.99, 4, 8, NULL, 17, 47, 'SSD NVMe M.2 2280 PCIe 4.0, 1 To, jusqu’à 7 000 Mo/s en lecture', 'https://m.media-amazon.com/images/I/71Sr1zjPhwL._AC_SL1500_.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `product_ranges`
--

CREATE TABLE `product_ranges` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `generation_fk` int(11) NOT NULL,
  `brand_fk` int(11) NOT NULL,
  `product_component_fk` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_ranges`
--

INSERT INTO `product_ranges` (`id`, `name`, `generation_fk`, `brand_fk`, `product_component_fk`, `description`) VALUES
(1, 'RTX 3050', 1, 1, 1, '8 Go GDDR6, 2560 cœurs CUDA, fréquence boost jusqu’à 1777 MHz'),
(2, 'RTX 3060', 1, 1, 1, '12 Go GDDR6, 3584 cœurs CUDA, fréquence boost jusqu’à 1777 MHz'),
(3, 'RTX 3070', 1, 1, 1, '8 Go GDDR6, 5888 cœurs CUDA, fréquence boost jusqu’à 1730 MHz'),
(4, 'RTX 3080', 1, 1, 1, '10 Go GDDR6X, 8704 cœurs CUDA, fréquence boost jusqu’à 1710 MHz'),
(5, 'RTX 3090', 1, 1, 1, '24 Go GDDR6X, 10496 cœurs CUDA, fréquence boost jusqu’à 1695 MHz'),
(6, 'i9-13900K', 6, 2, 2, '24 cœurs (8P+16E), fréquence boost jusqu’à 5.8 GHz, 36 Mo cache L3, TDP 125W'),
(7, 'i9-13900KF', 6, 2, 2, 'Sans iGPU, même specs que le 13900K, boost 5.8 GHz'),
(8, 'i7-12700K', 7, 2, 2, '12 cœurs (8P+4E), fréquence boost jusqu’à 5.0 GHz, 25 Mo cache L3, TDP 125W'),
(9, 'i7-12700KF', 7, 2, 2, 'Sans iGPU, identique au 12700K, boost 5.0 GHz'),
(10, 'Ryzen 9 5950X', 8, 2, 2, '16 cœurs / 32 threads, fréquence boost jusqu’à 4.9 GHz, 72 Mo de cache'),
(11, 'Ryzen 7 5800X', 8, 2, 2, '8 cœurs / 16 threads, fréquence boost jusqu’à 4.7 GHz, 36 Mo de cache'),
(12, 'Ryzen 5 5600X', 8, 2, 2, '6 cœurs / 12 threads, fréquence boost jusqu’à 4.6 GHz, 35 Mo de cache'),
(13, 'Ryzen 9 3900X', 9, 2, 2, '12 cœurs / 24 threads, fréquence boost jusqu’à 4.6 GHz, 70 Mo de cache'),
(14, 'Ryzen 7 3700X', 9, 2, 2, '8 cœurs / 16 threads, fréquence boost jusqu’à 4.4 GHz, 36 Mo de cache'),
(15, 'Ryzen 5 3600', 9, 2, 2, '6 cœurs / 12 threads, fréquence boost jusqu’à 4.2 GHz, 35 Mo de cache'),
(16, 'ROG Strix B550-F Gaming', 30, 14, 8, 'Socket AM4, chipset B550, format ATX, 4× DDR4 DIMM (jusqu’à 128 Go), PCIe 4.0'),
(17, 'ROG Strix B550-F Gaming WiFi', 30, 14, 8, 'Même carte que ci‑dessus, avec module Wi‑Fi 6 intégré et Bluetooth 5.1'),
(18, 'TUF Gaming Z590-Plus', 31, 14, 8, 'Socket LGA1200, chipset Z590, format ATX, support DDR4 jusqu’à 128 Go, LAN 2.5 Gb'),
(19, 'TUF Gaming Z590-Plus WiFi 6E', 31, 14, 8, 'Identique au Z590-Plus, avec Wi‑Fi 6E et Bluetooth 5.2'),
(20, 'MAG B550 TOMAHAWK Max', 32, 15, 8, 'Socket AM4, B550, ATX, 4× DDR4 (jusqu’à 128 Go), 2× M.2, LAN 2.5 Gb'),
(21, 'MAG B550 TOMAHAWK WiFi', 32, 15, 8, 'Version avec module Wi‑Fi 6 et Bluetooth 5.1 intégrés'),
(22, 'MEG Z490 GODLIKE', 33, 15, 8, 'Socket LGA1200, chipset Z490, format E-ATX, 4× DDR4, 3× M.2, LAN 10 Gb + 2.5 Gb'),
(23, 'MEG Z490 GODLIKE Carbon', 33, 15, 8, 'Édition spéciale avec dissipateur renforcé, RGB étendu et refroidissement actif'),
(24, 'Vengeance LPX 16GB (2×8GB) DDR4‑3200 C16', 10, 5, 3, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36'),
(25, 'Vengeance LPX 32GB (2×16GB) DDR4‑3200 C16', 10, 5, 3, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36'),
(26, 'Vengeance RGB Pro 16GB (2×8GB) DDR4‑3600 C18', 11, 5, 3, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑3600 MHz, timings 18‑22‑22‑42, éclairage RGB'),
(27, 'Vengeance RGB Pro 32GB (2×16GB) DDR4‑3600 C18', 11, 5, 3, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑3600 MHz, timings 18‑22‑22‑42, éclairage RGB'),
(28, 'HyperX Predator 16GB (2×8GB) DDR4‑3200 C16', 12, 6, 3, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36'),
(29, 'HyperX Predator 32GB (2×16GB) DDR4‑3200 C16', 12, 6, 3, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑3200 MHz, timings 16‑18‑18‑36'),
(30, 'HyperX Fury 16GB (2×8GB) DDR4‑2666 C16', 13, 6, 3, 'Kit dual‑channel 16 Go (2×8 Go) DDR4‑2666 MHz, timings 16‑18‑18'),
(31, 'HyperX Fury 32GB (2×16GB) DDR4‑2666 C16', 13, 6, 3, 'Kit dual‑channel 32 Go (2×16 Go) DDR4‑2666 MHz, timings 16‑18‑18'),
(32, 'RM750x', 18, 5, 5, '750W, 80+ Gold, full modulaire, ventilateur à roulement hydrodynamique'),
(33, 'RM850x', 18, 5, 5, '850W, 80+ Gold, full modulaire, ventilateur à roulement hydrodynamique'),
(34, 'HX1000i', 19, 5, 5, '1000W, 80+ Platinum, full modulaire, contrôle digital via iCUE'),
(35, 'HX1200i', 19, 5, 5, '1200W, 80+ Platinum, full modulaire, contrôle digital via iCUE'),
(36, 'Focus GX-650', 20, 9, 5, '650W, 80+ Gold, full modulaire, compact SFX-L compatible'),
(37, 'Focus GX-750', 20, 9, 5, '750W, 80+ Gold, full modulaire, compact SFX-L compatible'),
(38, 'Prime TX-850', 21, 9, 5, '850W, 80+ Titanium, full modulaire, condensateurs japonaises'),
(39, 'Prime TX-1000', 21, 9, 5, '1000W, 80+ Titanium, full modulaire, condensateurs japonaises'),
(40, 'Barracuda 120 1 To', 14, 7, 4, 'Disque dur 3,5″ SATA III, 1 To, 7200 tr/min, cache 64 Mo'),
(41, 'Barracuda 120 2 To', 14, 7, 4, 'Disque dur 3,5″ SATA III, 2 To, 7200 tr/min, cache 64 Mo'),
(42, 'FireCuda 530 500 Go', 15, 7, 4, 'SSD NVMe M.2 2280 PCIe 4.0, 500 Go, jusqu’à 7 300 Mo/s lecture'),
(43, 'FireCuda 530 1 To', 15, 7, 4, 'SSD NVMe M.2 2280 PCIe 4.0, 1 To, jusqu’à 7 300 Mo/s lecture'),
(44, 'WD Blue SN550 500 Go', 16, 8, 4, 'SSD NVMe M.2 2280 PCIe 3.0, 500 Go, jusqu’à 2 400 Mo/s lecture'),
(45, 'WD Blue SN550 1 To', 16, 8, 4, 'SSD NVMe M.2 2280 PCIe 3.0, 1 To, jusqu’à 2 400 Mo/s lecture'),
(46, 'WD Black SN850 500 Go', 17, 8, 4, 'SSD NVMe M.2 2280 PCIe 4.0, 500 Go, jusqu’à 7 000 Mo/s lecture'),
(47, 'WD Black SN850 1 To', 17, 8, 4, 'SSD NVMe M.2 2280 PCIe 4.0, 1 To, jusqu’à 7 000 Mo/s lecture');

-- --------------------------------------------------------

--
-- Structure de la table `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_types`
--

INSERT INTO `product_types` (`id`, `name`) VALUES
(1, 'Composant'),
(2, 'Ordinateur fixe'),
(3, 'Ordniateur portable');

-- --------------------------------------------------------

--
-- Structure de la table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_fk` int(10) UNSIGNED NOT NULL,
  `product_component_item_fk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `user_fk`, `product_component_item_fk`, `quantity`, `created_at`) VALUES
(5, 1, 1, 1, '2025-04-28 06:49:54'),
(7, 1, 6, 1, '2025-04-28 06:49:57');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `genre` varchar(10) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `billing_address_fk` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_fk` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mail`, `genre`, `picture`, `billing_address_fk`, `payment_method_fk`) VALUES
(1, 'liker', 'likeme', 'like@like.fr', NULL, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `billing_address`
--
ALTER TABLE `billing_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Index pour la table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `custom_models`
--
ALTER TABLE `custom_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_fk` (`brand_fk`),
  ADD KEY `generation_fk` (`generation_fk`),
  ADD KEY `product_range_fk` (`product_range_fk`),
  ADD KEY `product_component_fk` (`product_component_fk`);

--
-- Index pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_component_item_fk` (`product_component_item_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Index pour la table `generations`
--
ALTER TABLE `generations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_fk` (`brand_fk`),
  ADD KEY `product_component_fk` (`product_component_fk`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_fk`),
  ADD KEY `product_component_item_fk` (`product_component_item_fk`);

--
-- Index pour la table `product_components`
--
ALTER TABLE `product_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_type_fk` (`product_type_fk`);

--
-- Index pour la table `product_component_items`
--
ALTER TABLE `product_component_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_component_fk` (`product_component_fk`),
  ADD KEY `brand_fk` (`brand_fk`),
  ADD KEY `custom_model_fk` (`custom_model_fk`),
  ADD KEY `generation_fk` (`generation_fk`),
  ADD KEY `product_range_fk` (`product_range_fk`);

--
-- Index pour la table `product_ranges`
--
ALTER TABLE `product_ranges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_range_generation` (`generation_fk`),
  ADD KEY `fk_product_range_brand` (`brand_fk`),
  ADD KEY `fk_product_range_component` (`product_component_fk`);

--
-- Index pour la table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_fk`),
  ADD KEY `product_component_item_fk` (`product_component_item_fk`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `billing_address`
--
ALTER TABLE `billing_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `custom_models`
--
ALTER TABLE `custom_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `generations`
--
ALTER TABLE `generations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_components`
--
ALTER TABLE `product_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `product_component_items`
--
ALTER TABLE `product_component_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `product_ranges`
--
ALTER TABLE `product_ranges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `billing_address`
--
ALTER TABLE `billing_address`
  ADD CONSTRAINT `billing_address_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `custom_models`
--
ALTER TABLE `custom_models`
  ADD CONSTRAINT `custom_models_ibfk_1` FOREIGN KEY (`brand_fk`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `custom_models_ibfk_2` FOREIGN KEY (`generation_fk`) REFERENCES `generations` (`id`),
  ADD CONSTRAINT `custom_models_ibfk_3` FOREIGN KEY (`product_range_fk`) REFERENCES `product_ranges` (`id`),
  ADD CONSTRAINT `custom_models_ibfk_4` FOREIGN KEY (`product_component_fk`) REFERENCES `product_components` (`id`);

--
-- Contraintes pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`product_component_item_fk`) REFERENCES `product_component_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `generations`
--
ALTER TABLE `generations`
  ADD CONSTRAINT `generations_ibfk_1` FOREIGN KEY (`brand_fk`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `generations_ibfk_2` FOREIGN KEY (`product_component_fk`) REFERENCES `product_components` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_component_item_fk`) REFERENCES `product_component_items` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `product_component_items`
--
ALTER TABLE `product_component_items`
  ADD CONSTRAINT `product_component_items_ibfk_1` FOREIGN KEY (`product_component_fk`) REFERENCES `product_components` (`id`),
  ADD CONSTRAINT `product_component_items_ibfk_2` FOREIGN KEY (`brand_fk`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `product_component_items_ibfk_3` FOREIGN KEY (`custom_model_fk`) REFERENCES `custom_models` (`id`),
  ADD CONSTRAINT `product_component_items_ibfk_4` FOREIGN KEY (`generation_fk`) REFERENCES `generations` (`id`),
  ADD CONSTRAINT `product_component_items_ibfk_5` FOREIGN KEY (`product_range_fk`) REFERENCES `product_ranges` (`id`);

--
-- Contraintes pour la table `product_ranges`
--
ALTER TABLE `product_ranges`
  ADD CONSTRAINT `fk_product_range_brand` FOREIGN KEY (`brand_fk`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_range_component` FOREIGN KEY (`product_component_fk`) REFERENCES `product_components` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_range_generation` FOREIGN KEY (`generation_fk`) REFERENCES `generations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`product_component_item_fk`) REFERENCES `product_component_items` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
