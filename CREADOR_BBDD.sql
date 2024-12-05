CREATE DATABASE LigaFutbol;
USE LigaFutbol;

-- Tabla 'lliga'
CREATE TABLE lliga (
    id_lliga INT AUTO_INCREMENT PRIMARY KEY,
    nom_lliga VARCHAR(100) NOT NULL,
    temporada VARCHAR(20) NOT NULL
);

-- Tabla 'equip'
CREATE TABLE equip (
    id_equip INT AUTO_INCREMENT PRIMARY KEY,
    nom_equip VARCHAR(100) NOT NULL,
    ciutat VARCHAR(100) NOT NULL,
    id_lliga INT NOT NULL,
    FOREIGN KEY (id_lliga) REFERENCES lliga(id_lliga) ON DELETE CASCADE
);

-- Tabla 'jugador'
CREATE TABLE jugador (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    id_equip INT NOT NULL,
    FOREIGN KEY (id_equip) REFERENCES equip(id_equip) ON DELETE CASCADE
);

-- Tabla 'partit'
CREATE TABLE partit (
    id_partit INT AUTO_INCREMENT PRIMARY KEY,
    data_partit DATE NOT NULL,
    id_equip_local INT NOT NULL,
    id_equip_visitant INT NOT NULL,
    gols_local INT NOT NULL,
    gols_visitant INT NOT NULL,
    FOREIGN KEY (id_equip_local) REFERENCES equip(id_equip) ON DELETE CASCADE,
    FOREIGN KEY (id_equip_visitant) REFERENCES equip(id_equip) ON DELETE CASCADE
);

-- Tabla 'classificacio'
CREATE TABLE classificacio (
    id_classificacio INT AUTO_INCREMENT PRIMARY KEY,
    id_equip INT NOT NULL,
    punts INT NOT NULL,
    partits_jugats INT NOT NULL,
    victories INT NOT NULL,
    FOREIGN KEY (id_equip) REFERENCES equip(id_equip) ON DELETE CASCADE
);

--! CREA USUARI AMB PERMISOS

CREATE USER 'usuariProva'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON LigaFutbol.* TO 'usuariProva'@'localhost';
FLUSH PRIVILEGES;


