-- Suppression de exo_contacts si elle existe 
DROP DATABASE IF EXISTS exo_contacts;

-- Création de exo_contacts si elle n'existe pas
CREATE DATABASE IF NOT EXISTS exo_contacts;

-- J'utilise la base de donnée exo_contact
USE exo_contacts;

-- Création de la table des pays
CREATE TABLE IF NOT EXISTS pays (
    iso_3 VARCHAR(3) PRIMARY KEY,
    nom VARCHAR(70) NOT NULL,
    iso_2 VARCHAR(2) NOT NULL,
    nationalite VARCHAR(50) NOT NULL
);

-- Création de la table des contacts
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70) NOT NULL,
    date_de_naissance DATE NOT NULL,
    sexe VARCHAR(10) NOT NULL,
    adresse TEXT NOT NULL,
    cp VARCHAR(10) NOT NULL,
    ville VARCHAR(70) NOT NULL,
    pays_iso_3 VARCHAR(3) NOT NULL,
    FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3)
);

-- Création de la table des numéros de téléphone
CREATE TABLE IF NOT EXISTS telephone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_contact INT NOT NULL,
    numero VARCHAR(50) NOT NULL,
    type TINYINT NOT NULL,
    FOREIGN KEY (id_contact) REFERENCES contacts(id)
);

INSERT INTO pays (iso_3, nom, iso_2, nationalite)
VALUES
    ('DEU', 'Allemagne', 'DE', 'Allemande'),
    ('ESP', 'Espagne', 'ES', 'Espagnole'),
    ('ITA', 'Italie', 'IT', 'Italienne'),
    ('GBR', 'Royaume-Uni', 'GB', 'Britannique'),
    ('FRA', 'France', 'FR', 'Française'),
    ('NLD', 'Pays-Bas', 'NL', 'Néerlandaise'),
    ('BEL', 'Belgique', 'BE', 'Belge'),
    ('AUT', 'Autriche', 'AT', 'Autrichienne'),
    ('CHE', 'Suisse', 'CH', 'Suisse'),
    ('SWE', 'Suède', 'SE', 'Suédoise');