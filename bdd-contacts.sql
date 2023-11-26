-- Suppression de bdd-contacts si elle existe 
DROP DATABASE IF EXISTS exo_contacts;

-- Création de bdd-contacts si elle n'existe pas
CREATE DATABASE IF NOT EXISTS exo_contacts;

-- J'utilise la base de donnée bdd-contact
USE exo_contacts;

-- Création de la table des pays
CREATE TABLE IF NOT EXISTS pays (
    iso_3 VARCHAR(3) PRIMARY KEY,
    nom VARCHAR(70) NOT NULL,
    iso_2 VARCHAR(2) NOT NULL,
    nationalite VARCHAR(50) NOT NULL
);