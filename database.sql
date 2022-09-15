CREATE TABLE apparaten (
	ID int NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(40) NOT NULL UNIQUE,
    Omschrijving VARCHAR(200),
    Vergoeding decimal(4,2),
    GewichtGram int,
    PRIMARY KEY (ID)
);

CREATE TABLE onderdelen (
	ID int NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(40) NOT NULL UNIQUE,
    Omschrijving VARCHAR(200),
    VoorraadKg int NOT NULL,
    PrijsPerKg decimal(4,2) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE rollen (
    ID int NOT NULL AUTO_INCREMENT,
    RolID int NOT NULL,
    Naam VARCHAR(40) NOT NULL,
    Wachtwoord VARCHAR(40) NOT NULL,
    Emailadres VARCHAR(100) NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY (RolID) REFERENCES rollen(ID)
);

CREATE TABLE medewerkers (
    ID int NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(40) NOT NULL UNIQUE,
    Omschrijving VARCHAR(200),
    Waarde int NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE innames (
	ID int NOT NULL AUTO_INCREMENT,
    MedewerkerID int NOT NULL,
    Tijdstip DATETIME NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY (MedewerkerID) REFERENCES medewerkers(ID)
);

CREATE TABLE onderdelen (
	ID int NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(40) NOT NULL UNIQUE,
    Omschrijving VARCHAR(200),
    VoorraadKg int NOT NULL,
    PrijsPerKg decimal(4,2) NOT NULL
);

CREATE TABLE onderdelen (
	ID int NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(40) NOT NULL UNIQUE,
    Omschrijving VARCHAR(200),
    VoorraadKg int NOT NULL,
    PrijsPerKg decimal(4,2) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE onderdeelapparaat(
	ID int NOT NULL AUTO_INCREMENT,
    OnderdeelID int NOT NULL,
    ApparaatID int NOT NULL,
    Percentage int,
    PRIMARY KEY (ID),
    FOREIGN KEY (OnderdeelID) REFERENCES onderdelen(ID),
    FOREIGN KEY (ApparaatID) REFERENCES apparaten(ID)
);

CREATE TABLE innameapparaat (
	ID int NOT NULL AUTO_INCREMENT,
    InnameID int NOT NULL,
    ApparaatID int NOT NULL,
    Ontleed boolean NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (InnameID) REFERENCES innames(ID),
    FOREIGN KEY (ApparaatID) REFERENCES apparaten(ID)
);

CREATE TABLE uitgiftes (
	ID int NOT NULL AUTO_INCREMENT,
    MedewerkerID int NOT NULL,
    OnderdeelID int NOT NULL,
    Tijdstip DATETIME NOT NULL,
    GewichtKG int NOT NULL,
    Prijs decimal(4,2),
    PRIMARY KEY (id),
    FOREIGN KEY (MedewerkerID) REFERENCES medewerkers(ID),
    FOREIGN KEY (OnderdeelID) REFERENCES onderdelen(ID)
);

INSERT INTO `rollen` (`ID`, `Naam`, `Omschrijving`, `Waarde`) VALUES (NULL, 'Medewerker Inname', 'Is verantwoordelijk voor het innemen van de apparaten.', '1');

INSERT INTO `rollen` (`ID`, `Naam`, `Omschrijving`, `Waarde`) VALUES (NULL, 'Medewerker Verwerking', 'Demonteert de apparaten en verwerkt de onderdelen', '2');

INSERT INTO `rollen` (`ID`, `Naam`, `Omschrijving`, `Waarde`) VALUES (NULL, 'Medewerker Uitgifte', 'Verzorgt de afvoer van onderdelen', '3');

INSERT INTO `rollen` (`ID`, `Naam`, `Omschrijving`, `Waarde`) VALUES (NULL, 'Applicatiebeheerder', 'Kan apparaten en onderdelen benoemen en koppelen', '4');

INSERT INTO `rollen` (`ID`, `Naam`, `Omschrijving`, `Waarde`) VALUES (NULL, 'Administrator', 'Is verantwoordelijk voor het aanmaken van gebruikers en de correcte verdeling van rollen en rechten (Gebruiksbeheerder)', '5');

INSERT INTO `rollen` (`ID`, `Naam`, `Omschrijving`, `Waarde`) VALUES (NULL, 'Algemene medewerker', 'Zijdelings betrokken bij het geautomatiseerde proces. Mag (alleen) de diverse rapportages inzien.', '6');

INSERT INTO `medewerkers` (`ID`, `RolID`, `Naam`, `Wachtwoord`, `Emailadres`) VALUES (NULL, '4', 'Naomi', '123', '123@abc.nl');

INSERT INTO `apparaten` (`ID`, `Naam`, `Omschrijving`, `Vergoeding`, `GewichtGram`) VALUES (NULL, 'Centrifuge', NULL, '5,56', '25800');