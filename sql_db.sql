-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db-buf-03.sparkedhost.us:3306
-- Généré le : lun. 10 juil. 2023 à 14:27
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1-log
-- Version de PHP : 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `s91440_botv14`
--

-- --------------------------------------------------------

--
-- Structure de la table `account_skins`
--

CREATE TABLE `account_skins` (
  `account_id` int(11) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `account_skins`
--

INSERT INTO `account_skins` (`account_id`, `skin_id`) VALUES
(1, 28),
(1, 29),
(1, 31),
(1, 32),
(5, 28),
(6, 28),
(7, 28),
(7, 37),
(8, 28),
(8, 32),
(8, 37);

-- --------------------------------------------------------

--
-- Structure de la table `server`
--

CREATE TABLE `server` (
  `guild` varchar(255) NOT NULL,
  `antiraid` varchar(255) NOT NULL,
  `reactionrole` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `server`
--

INSERT INTO `server` (`guild`, `antiraid`, `reactionrole`) VALUES
('1079852990401355856', 'false', '1080618516731924570 1087809562528190584'),
('1091140419896750190', 'false', '');

-- --------------------------------------------------------

--
-- Structure de la table `skins`
--

CREATE TABLE `skins` (
  `id` int(11) NOT NULL,
  `skinname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skins`
--

INSERT INTO `skins` (`id`, `skinname`) VALUES
(1, 'Aucun'),
(9, 'mecha'),
(27, 'testzed'),
(28, 'mecha zed'),
(29, 'test'),
(31, 'zed test'),
(32, 'mecha diana'),
(34, 'ouiskin'),
(35, 'ouiskin2'),
(36, 'zed empereur'),
(37, 'diana reine');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mdpmail` varchar(255) NOT NULL,
  `nomlol` varchar(255) NOT NULL,
  `mdplol` varchar(255) NOT NULL,
  `utilisateur` varchar(255) DEFAULT NULL,
  `afficher` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `mail`, `mdpmail`, `nomlol`, `mdplol`, `utilisateur`, `afficher`) VALUES
(1, 'apou@mail.com', 'mdpmail', 'nomlolapou', 'mdplolapou', NULL, 1),
(2, 'mail2@mail', 'sgd', 'sdfgv', 'sdgsdg', '675818862079639594', 0),
(3, 'sdg', 'sdg', 'sgd', 'sdg', '675818862079639594', 0),
(4, 'fdhg', 'dsfhg', 'sfdhg', 'sfhg', '675818862079639594', 0),
(5, 'sfdg', 'sgd', 'sdg', 'sdhg', NULL, 1),
(6, 'edfh', 'dfgh', 'gfh', 'fghj', NULL, 1),
(7, 'ss', 'sd', 'sgd', 'sdg', NULL, 1),
(8, 'sd', 'gsd', 'gf', 'gfsd', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `warns`
--

CREATE TABLE `warns` (
  `guild` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `warn` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `warns`
--

INSERT INTO `warns` (`guild`, `user`, `author`, `warn`, `reason`, `date`) VALUES
('1079852990401355856', '352148113173250048', '675818862079639594', 'WARN-1SXIRERGIJ', 'Fils de pute', '1678352006836'),
('1079852990401355856', '352148113173250048', '675818862079639594', 'WARN-I841PF61XG', 'Pd', '1678352051032'),
('1091140419896750190', '1044686626154098740', '675818862079639594', 'WARN-LO84S', 'raison test', '1688544311577');

-- --------------------------------------------------------

--
-- Structure de la table `xp`
--

CREATE TABLE `xp` (
  `user` varchar(255) NOT NULL,
  `guild` varchar(255) NOT NULL,
  `xp` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `xp`
--

INSERT INTO `xp` (`user`, `guild`, `xp`, `level`) VALUES
('675818862079639594', '1079852990401355856', '790', '2'),
('1079851979129499779', '1079852990401355856', '0', '0'),
('325711234735538182', '1079852990401355856', '277', '0'),
('219076421996249088', '1079852990401355856', '139', '0'),
('650814034643386400', '1079852990401355856', '0', '0'),
('675818862079639594', '1091140419896750190', '556', '4'),
('1044686626154098740', '1091140419896750190', '132', '0'),
('352148113173250048', '1091140419896750190', '120', '0'),
('874433373806944297', '1091140419896750190', '21', '1'),
('386606551231627274', '1091140419896750190', '0', '0'),
('523525087983566861', '1091140419896750190', '0', '0'),
('975092605308244078', '1091140419896750190', '0', '0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account_skins`
--
ALTER TABLE `account_skins`
  ADD PRIMARY KEY (`account_id`,`skin_id`),
  ADD KEY `skin_id` (`skin_id`);

--
-- Index pour la table `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `skins`
--
ALTER TABLE `skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `account_skins`
--
ALTER TABLE `account_skins`
  ADD CONSTRAINT `account_skins_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `account_skins_ibfk_2` FOREIGN KEY (`skin_id`) REFERENCES `skins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
