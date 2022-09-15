-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 15 sep 2022 om 16:09
-- Serverversie: 10.4.21-MariaDB
-- PHP-versie: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superiorwaste`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `apparaten`
--

CREATE TABLE `apparaten` (
  `ID` int(11) NOT NULL,
  `Naam` varchar(40) NOT NULL,
  `Omschrijving` varchar(200) DEFAULT NULL,
  `Vergoeding` decimal(4,2) DEFAULT NULL,
  `GewichtGram` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `apparaten`
--

INSERT INTO `apparaten` (`ID`, `Naam`, `Omschrijving`, `Vergoeding`, `GewichtGram`) VALUES
(1, 'Centrifuge', NULL, '5.00', 25800);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `innameapparaat`
--

CREATE TABLE `innameapparaat` (
  `ID` int(11) NOT NULL,
  `InnameID` int(11) NOT NULL,
  `ApparaatID` int(11) NOT NULL,
  `Ontleed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `innames`
--

CREATE TABLE `innames` (
  `ID` int(11) NOT NULL,
  `MedewerkerID` int(11) NOT NULL,
  `Tijdstip` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerkers`
--

CREATE TABLE `medewerkers` (
  `ID` int(11) NOT NULL,
  `RolID` int(11) NOT NULL,
  `Naam` varchar(40) NOT NULL,
  `Wachtwoord` varchar(40) NOT NULL,
  `Emailadres` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `medewerkers`
--

INSERT INTO `medewerkers` (`ID`, `RolID`, `Naam`, `Wachtwoord`, `Emailadres`) VALUES
(2, 4, 'Naomi', '123', '123@abc.nl'),
(3, 5, 'Henk', '123', 'henk@henk.nl');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdeelapparaat`
--

CREATE TABLE `onderdeelapparaat` (
  `ID` int(11) NOT NULL,
  `OnderdeelID` int(11) NOT NULL,
  `ApparaatID` int(11) NOT NULL,
  `Percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdelen`
--

CREATE TABLE `onderdelen` (
  `ID` int(11) NOT NULL,
  `Naam` varchar(40) NOT NULL,
  `Omschrijving` varchar(200) DEFAULT NULL,
  `VoorraadKg` int(11) NOT NULL,
  `PrijsPerKg` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rollen`
--

CREATE TABLE `rollen` (
  `ID` int(11) NOT NULL,
  `Naam` varchar(40) NOT NULL,
  `Omschrijving` varchar(200) DEFAULT NULL,
  `Waarde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `rollen`
--

INSERT INTO `rollen` (`ID`, `Naam`, `Omschrijving`, `Waarde`) VALUES
(1, 'Medewerker Inname', 'Is verantwoordelijk voor het innemen van de apparaten.', 1),
(2, 'Medewerker Verwerking', 'Demonteert de apparaten en verwerkt de onderdelen', 2),
(3, 'Medewerker Uitgifte', 'Verzorgt de afvoer van onderdelen', 3),
(4, 'Applicatiebeheerder', 'Kan apparaten en onderdelen benoemen en koppelen', 4),
(5, 'Administrator', 'Is verantwoordelijk voor het aanmaken van gebruikers en de correcte verdeling van rollen en rechten (Gebruiksbeheerder)', 5),
(6, 'Algemene medewerker', 'Zijdelings betrokken bij het geautomatiseerde proces. Mag (alleen) de diverse rapportages inzien.', 6);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `uitgiftes`
--

CREATE TABLE `uitgiftes` (
  `ID` int(11) NOT NULL,
  `MedewerkerID` int(11) NOT NULL,
  `OnderdeelID` int(11) NOT NULL,
  `Tijdstip` datetime NOT NULL,
  `GewichtKG` int(11) NOT NULL,
  `Prijs` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `apparaten`
--
ALTER TABLE `apparaten`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Naam` (`Naam`);

--
-- Indexen voor tabel `innameapparaat`
--
ALTER TABLE `innameapparaat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `InnameID` (`InnameID`),
  ADD KEY `ApparaatID` (`ApparaatID`);

--
-- Indexen voor tabel `innames`
--
ALTER TABLE `innames`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MedewerkerID` (`MedewerkerID`);

--
-- Indexen voor tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RolID` (`RolID`);

--
-- Indexen voor tabel `onderdeelapparaat`
--
ALTER TABLE `onderdeelapparaat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OnderdeelID` (`OnderdeelID`),
  ADD KEY `ApparaatID` (`ApparaatID`);

--
-- Indexen voor tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Naam` (`Naam`);

--
-- Indexen voor tabel `rollen`
--
ALTER TABLE `rollen`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Naam` (`Naam`);

--
-- Indexen voor tabel `uitgiftes`
--
ALTER TABLE `uitgiftes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MedewerkerID` (`MedewerkerID`),
  ADD KEY `OnderdeelID` (`OnderdeelID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `apparaten`
--
ALTER TABLE `apparaten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `innameapparaat`
--
ALTER TABLE `innameapparaat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `innames`
--
ALTER TABLE `innames`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `onderdeelapparaat`
--
ALTER TABLE `onderdeelapparaat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `rollen`
--
ALTER TABLE `rollen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `uitgiftes`
--
ALTER TABLE `uitgiftes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `innameapparaat`
--
ALTER TABLE `innameapparaat`
  ADD CONSTRAINT `innameapparaat_ibfk_1` FOREIGN KEY (`InnameID`) REFERENCES `innames` (`ID`),
  ADD CONSTRAINT `innameapparaat_ibfk_2` FOREIGN KEY (`ApparaatID`) REFERENCES `apparaten` (`ID`);

--
-- Beperkingen voor tabel `innames`
--
ALTER TABLE `innames`
  ADD CONSTRAINT `innames_ibfk_1` FOREIGN KEY (`MedewerkerID`) REFERENCES `medewerkers` (`ID`);

--
-- Beperkingen voor tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD CONSTRAINT `medewerkers_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `rollen` (`ID`);

--
-- Beperkingen voor tabel `onderdeelapparaat`
--
ALTER TABLE `onderdeelapparaat`
  ADD CONSTRAINT `onderdeelapparaat_ibfk_1` FOREIGN KEY (`OnderdeelID`) REFERENCES `onderdelen` (`ID`),
  ADD CONSTRAINT `onderdeelapparaat_ibfk_2` FOREIGN KEY (`ApparaatID`) REFERENCES `apparaten` (`ID`);

--
-- Beperkingen voor tabel `uitgiftes`
--
ALTER TABLE `uitgiftes`
  ADD CONSTRAINT `uitgiftes_ibfk_1` FOREIGN KEY (`MedewerkerID`) REFERENCES `medewerkers` (`ID`),
  ADD CONSTRAINT `uitgiftes_ibfk_2` FOREIGN KEY (`OnderdeelID`) REFERENCES `onderdelen` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
