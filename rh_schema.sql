DROP DATABASE roseHybrids;
CREATE DATABASE roseHybrids;
USE roseHybrids; 

CREATE TABLE rosa (
    species VARCHAR(50) NOT NULL,
    commonName VARCHAR(50) NOT NULL,
    PRIMARY KEY (species)
    );

CREATE TABLE cultivar (
    cultivarID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cultivarName VARCHAR(50) NOT NULL DEFAULT '',
    species VARCHAR(50) NOT NULL,
    color VARCHAR(100) NOT NULL,
    scent VARCHAR(100) NOT NULL,
    growth VARCHAR(100) NOT NULL,
    notes VARCHAR(200) NOT NULL,
    FOREIGN KEY (species) REFERENCES rosa (species),
    PRIMARY KEY (cultivarID)
    );

CREATE TABLE roseDiseases (
    diseaseID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    diseaseName VARCHAR(50) NOT NULL,
    PRIMARY KEY (diseaseID)
    );

CREATE TABLE hybrids (
    hybridID VARCHAR(50) NOT NULL,
    crossID INT UNSIGNED NOT NULL,
    seedParent INT UNSIGNED NOT NULL,
    pollenParent INT UNSIGNED NOT NULL,
    color VARCHAR(100) NOT NULL,
    scent VARCHAR(100) NOT NULL,
    growth VARCHAR(100) NOT NULL,
    notes VARCHAR(200) NOT NULL,
    culled TINYINT NOT NULL,
    FOREIGN KEY (seedParent) REFERENCES cultivar (cultivarID),
    FOREIGN KEY (pollenParent) REFERENCES cultivar (cultivarID),
    PRIMARY KEY (hybridID, crossID)
    );

CREATE TABLE hybridDiseases (
    hybridDisID INT UNSIGNED NOT NULL,
    diseaseID INT UNSIGNED NOT NULL,
    hybridID VARCHAR(50) NOT NULL,
    crossID INT UNSIGNED NOT NULL,
    diseaseResistance INT UNSIGNED NOT NULL,
    FOREIGN KEY (diseaseID) REFERENCES roseDiseases (diseaseID),
    FOREIGN KEY (hybridID,crossID) REFERENCES hybrids (hybridID, crossID),
    PRIMARY KEY (hybridDisID)
    );



