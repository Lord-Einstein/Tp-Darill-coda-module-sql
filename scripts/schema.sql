-- =========================================
-- SCRIPT DE RESET (Celui envoyé sur Discord)
-- =========================================

-- Drop complet du schéma
DROP SCHEMA IF EXISTS beerProject CASCADE;

-- Recréation du schéma
CREATE SCHEMA beerProject;

-- Utilisation du schéma
SET search_path TO beerProject;


-- =========================================
-- QUARTIER
-- =========================================
CREATE TABLE beerProject.quartier (
    id_quartier SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

-- =========================================
-- BAR
-- =========================================
CREATE TABLE beerProject.bar (
    id_bar SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    adresse TEXT NOT NULL,
    id_quartier INT NOT NULL,
    FOREIGN KEY (id_quartier) REFERENCES beerProject.quartier(id_quartier)
);

-- =========================================
-- BIERE
-- =========================================
CREATE TABLE beerProject.biere (
    id_biere SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    type VARCHAR(100) NOT NULL,
    degres FLOAT NOT NULL CHECK (degres > 0),
    categorie VARCHAR(100) NOT NULL
);

-- =========================================
-- PRIX
-- =========================================
CREATE TABLE beerProject.prix (
    id_prix SERIAL PRIMARY KEY,
    id_bar INT NOT NULL,
    id_biere INT NOT NULL,
    prix NUMERIC(5,2) NOT NULL CHECK (prix > 0),
    
    FOREIGN KEY (id_bar) REFERENCES beerProject.bar(id_bar),
    FOREIGN KEY (id_biere) REFERENCES beerProject.biere(id_biere),

    -- Ici j'ai implémenté ma règle métier qui relie un prix précis à un bar et une bière précise
    UNIQUE (id_bar, id_biere)
);
