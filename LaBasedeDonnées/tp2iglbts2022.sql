-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 22 avr. 2023 à 13:59
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp2iglbts2022`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `IDCLIENT` int(11) NOT NULL,
  `NOMCLIENT` varchar(50) DEFAULT NULL,
  `PRENOMCLIENT` varchar(50) DEFAULT NULL,
  `TELEPHONECLIENT` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`IDCLIENT`, `NOMCLIENT`, `PRENOMCLIENT`, `TELEPHONECLIENT`) VALUES
(1, 'NTSE', 'DIANE', '222222'),
(2, 'KAMGA', 'ANDRE', '333333'),
(3, 'DAVY', 'JULES', '655 85 89 98'),
(4, 'ELOUNDOU', 'ROGER', '655 88 77 89');

-- --------------------------------------------------------

--
-- Structure de la table `commandeproduit`
--

CREATE TABLE `commandeproduit` (
  `REFERENCECOMMANDEPRODUIT` varchar(25) NOT NULL,
  `IDCLIENT` int(11) NOT NULL,
  `DATECOMMANDEPRODUIT` date DEFAULT NULL,
  `ADRESSELIVRAISONCOMMANDEPRODUIT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `concerner`
--

CREATE TABLE `concerner` (
  `REFERENCECOMMANDEPRODUIT` varchar(25) NOT NULL,
  `CODEPRODUIT` varchar(25) NOT NULL,
  `QUANTITECOMMANDE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `CODEPRODUIT` varchar(25) NOT NULL,
  `LIBELLEPRODUIT` varchar(50) DEFAULT NULL,
  `PRIXPRODUIT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`IDCLIENT`);

--
-- Index pour la table `commandeproduit`
--
ALTER TABLE `commandeproduit`
  ADD PRIMARY KEY (`REFERENCECOMMANDEPRODUIT`),
  ADD KEY `FK_PASSER` (`IDCLIENT`);

--
-- Index pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD PRIMARY KEY (`REFERENCECOMMANDEPRODUIT`,`CODEPRODUIT`),
  ADD KEY `FK_CONCERNER2` (`CODEPRODUIT`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`CODEPRODUIT`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `IDCLIENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandeproduit`
--
ALTER TABLE `commandeproduit`
  ADD CONSTRAINT `FK_PASSER` FOREIGN KEY (`IDCLIENT`) REFERENCES `client` (`IDCLIENT`);

--
-- Contraintes pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD CONSTRAINT `FK_CONCERNER` FOREIGN KEY (`REFERENCECOMMANDEPRODUIT`) REFERENCES `commandeproduit` (`REFERENCECOMMANDEPRODUIT`),
  ADD CONSTRAINT `FK_CONCERNER2` FOREIGN KEY (`CODEPRODUIT`) REFERENCES `produit` (`CODEPRODUIT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
