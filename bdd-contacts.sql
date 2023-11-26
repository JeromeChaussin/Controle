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

-- Ajout d'informations dans la table pays
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

-- Ajout d'informations pour la table contacts
INSERT INTO contacts (nom, prenom, date_de_naissance, sexe, adresse, cp, ville, pays_iso_3)
VALUES
    ('Schmidt', 'Michael', '1995-07-10', 'M', '456 Rue de l Érable', '98765', 'Berlin', 'DEU'),
    ('Lopez', 'Maria', '1980-12-05', 'F', '123 Rue du Pin', '12345', 'Madrid', 'ESP'),
    ('Ricci', 'Luca', '1992-09-15', 'M', '789 Rue du Frêne', '54321', 'Rome', 'ITA'),
    ('Santos', 'Ana', '1984-06-25', 'F', '456 Rue du Bouleau', '34567', 'Londres', 'GBR'),
    ('Martin', 'Sophie', '1988-03-20', 'F', '789 Rue du Chêne', '75000', 'Paris', 'FRA'),
    ('Jansen', 'Erik', '1983-04-18', 'M', '123 Rue du Cèdre', '67890', 'Amsterdam', 'NLD'),
    ('Dubois', 'Camille', '1991-01-30', 'F', '789 Rue du Séquoia', '23456', 'Bruxelles', 'BEL'),
    ('Müller', 'Andreas', '1986-08-12', 'M', '456 Rue du Sapin', '87654', 'Vienne', 'AUT'),
    ('Lefevre', 'Juliette', '1990-11-08', 'F', '123 Rue du Peuplier', '65432', 'Genève', 'CHE'),
    ('Andersson', 'Lars', '1982-02-28', 'M', '789 Rue de l Épicéa', '32109', 'Stockholm', 'SWE');
