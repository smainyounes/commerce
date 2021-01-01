-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 01, 2021 at 08:05 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type_admin` varchar(30) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categ_fr` varchar(50) NOT NULL,
  `nom_categ_ar` varchar(50) CHARACTER SET utf8 NOT NULL,
  `icon_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `nom_complet` varchar(255) CHARACTER SET utf8 NOT NULL,
  `wilaya` varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  `address` text CHARACTER SET utf8 NOT NULL,
  `tel` varchar(20) NOT NULL,
  `observation` text CHARACTER SET utf8 NOT NULL,
  `etat_commande` varchar(20) NOT NULL,
  `date_commande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_livraison` timestamp NOT NULL,
  PRIMARY KEY (`id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `img_produit`
--

DROP TABLE IF EXISTS `img_produit`;
CREATE TABLE IF NOT EXISTS `img_produit` (
  `id_img` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_img`),
  KEY `id_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `id_sous_category` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  `prix_remise` int(11) NOT NULL,
  `infos` text NOT NULL,
  `etat_produit` varchar(50) NOT NULL,
  `date_produit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produit`),
  KEY `id_sous_category` (`id_sous_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produit_commander`
--

DROP TABLE IF EXISTS `produit_commander`;
CREATE TABLE IF NOT EXISTS `produit_commander` (
  `id_prod_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_prod_commande`),
  KEY `id_commande` (`id_commande`),
  KEY `id_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sous_category`
--

DROP TABLE IF EXISTS `sous_category`;
CREATE TABLE IF NOT EXISTS `sous_category` (
  `id_sous_category` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NOT NULL,
  `nom_sous_ar` varchar(50) CHARACTER SET utf8 NOT NULL,
  `nom_sous_fr` varchar(50) NOT NULL,
  `icon_sous` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sous_category`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `img_produit`
--
ALTER TABLE `img_produit`
  ADD CONSTRAINT `img_produit_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_sous_category`) REFERENCES `sous_category` (`id_sous_category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produit_commander`
--
ALTER TABLE `produit_commander`
  ADD CONSTRAINT `produit_commander_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_commander_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sous_category`
--
ALTER TABLE `sous_category`
  ADD CONSTRAINT `sous_category_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
