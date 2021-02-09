DROP DATABASE IF EXISTS EXPRESSFOOD;

CREATE DATABASE EXPRESSFOOD;

USE EXPRESSFOOD;

drop table if exists compte;
drop table if exists client;
drop table if exists cuisinier;
drop table if exists livreur;
drop table if exists plat;
drop table if exists client_adresse;
drop table if exists commande_adresse;

CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`compte`
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`client`
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `mdp` VARCHAR(255) NOT NULL,
    `mail` VARCHAR(255) NOT NULL,
    `tel` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_client_1`
    FOREIGN KEY (`id`)
    REFERENCES `EXPRESSFOOD`.`compte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`client_adresse` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `adresse` VARCHAR(255) NOT NULL,
    `ville` VARCHAR(255) NOT NULL,
    `cp` VARCHAR(255) NOT NULL,
    `pays` VARCHAR(255) NOT NULL,
    `info_livraison` VARCHAR(255) NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_client_adresse_1`
    FOREIGN KEY (`id`)
    REFERENCES `EXPRESSFOOD`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`livreur` 
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `mail` VARCHAR(255) NOT NULL,
    `mdp` VARCHAR(255) NOT NULL,
    `tel` VARCHAR(45) NOT NULL,
    `statu` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255) NOT NULL,
    `nb_plat` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `fk_livreur_compte1_unique` (`id` ASC) VISIBLE,
    CONSTRAINT `fk_livreur_compte1`
    FOREIGN KEY (`id`)
    REFERENCES `EXPRESSFOOD`.`compte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`commande_adresse` 
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `adresse` VARCHAR(255) NOT NULL,
    `ville` VARCHAR(255) NOT NULL,
    `cp` VARCHAR(255) NOT NULL,
    `pays` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`commande` 
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `date_paiement` TIMESTAMP NOT NULL,
    `date_creation` TIMESTAMP NOT NULL,
    `date_livraison` TIMESTAMP NOT NULL,
    `prix` DECIMAL(4,2) NOT NULL,
    `livreur_id1` INT NULL,
    `client_id` INT NOT NULL,
    PRIMARY KEY (`id`, `livreur_id1`, `client_id`),
    INDEX `fk_commande_livreur1_idx` (`livreur_id1` ASC) VISIBLE,
    INDEX `fk_commande_client_idx` (`client_id` ASC) VISIBLE,
    CONSTRAINT `fk_commande_livreur1`
    FOREIGN KEY (`livreur_id1`)
    REFERENCES `EXPRESSFOOD`.`livreur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_commande_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `EXPRESSFOOD`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_commande_adresse`
    FOREIGN KEY (`id`)
    REFERENCES `EXPRESSFOOD`.`commande_adresse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`cuisinier` 
(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `mail` VARCHAR(255) NOT NULL,
    `mdp` VARCHAR(255) NOT NULL,
    `tel` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_cuisinier_1`
    FOREIGN KEY (`id`)
    REFERENCES `EXPRESSFOOD`.`compte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`plat` 
(
    `id` INT NOT NULL,
    `nom` VARCHAR(255) NOT NULL,
    `details` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `date_publication` DATETIME NOT NULL,
    `date_conditionnement` DATETIME NOT NULL,
    `prix` FLOAT NOT NULL,
    `cuisinier_id` INT NOT NULL,
    `commande_id` INT NULL,
    PRIMARY KEY (`id`, `cuisinier_id`, `commande_id`),
    INDEX `fk_plat_cuisinier1_idx` (`cuisinier_id` ASC) VISIBLE,
    INDEX `fk_plat_commande1_idx` (`commande_id` ASC) VISIBLE,
    CONSTRAINT `fk_plat_cuisinier1`
    FOREIGN KEY (`cuisinier_id`)
    REFERENCES `EXPRESSFOOD`.`cuisinier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_plat_commande1`
    FOREIGN KEY (`commande_id`)
    REFERENCES `EXPRESSFOOD`.`commande` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


INSERT INTO `compte` (`id`, `type`)
VALUES
(1, 'Client'),
(2, 'Client'),
(3, 'Livreur'),
(4, 'Livreur'),
(5, 'Cuisinier'),
(6, 'Cuisinier'),
(7, 'Client'),
(8, 'Livreur');

INSERT INTO `client` (`id`, `nom`, `mdp`, `mail`, `tel`)
VALUES
('1', 'Marta', 'azeaze', 'marta@gmail.fr', '45645665'),
('2', 'Robert', 'qsdaze789', 'roro@hotmail.fr', '45321987');

INSERT INTO `cuisinier` (`id`, `nom`, `mail`, `mdp`, `tel`) 
VALUES
('5', 'Gusto', 'gugu@gmail.fr', 'mlkmlkmlk', '010407080502'), 
('6', 'Paul', 'paul@hotmail.fr', 'qsdwxcaze', '321654987'); 

INSERT INTO `livreur` (`id`, `nom`, `mail`, `mdp`, `tel`, `statu`, `position`, `nb_plat`)
VALUES 
('3', 'Valérie', 'vava@yahoo.fr', 'qsdqsd', '2123655487', 'libre', '48.83588033169718, 2.3970926578372955', '0'), 
('4', 'Henri', 'hh@live.fr', 'poiuyt', '456456456', 'livraison', '48.862341395242986, 2.3726738269676537', '8');

INSERT INTO `client_adresse` (`id`, `adresse`, `ville`, `cp`, `pays`, `info_livraison`)
VALUES
('2', '48 rue de Paris', 'Paris', '75012', 'France', 'code 1548\r\nappart 5'),
('1', "12 rue de l'église", 'Paris', '75002', 'France', NULL);


INSERT INTO `commande_adresse` (`id`, `adresse`, `ville`, `cp`, `pays`)
VALUES 
('1', '48 rue de paris', 'Paris', '75002', 'France'), 
('2', "12 rue de l'église", 'Paris', '75014', 'France');

INSERT INTO `commande` (`id`, `date_paiement`, `date_creation`, `date_livraison`, `prix`, `livreur_id1`, `client_id`)
VALUES 
('2', '2021-02-08 11:11:23', '2021-02-08 11:11:23', '2021-02-08 11:15:23', '20.8', '4', '1'), 
('1', '2021-02-08 11:11:23', '2021-02-08 11:11:23', '2021-02-08 11:20:23', '41.3', '3', '2');

INSERT INTO `plat` (`id`, `nom`, `details`, `image`, `date_publication`, `date_conditionnement`, `prix`, `cuisinier_id`, `commande_id`) 
VALUES 
('1', 'Pâte carbo', 'Lardon, oignon, champignon...', 'asset/img/pate_carbo.jpeg', '2021-02-08 10:44:25', '2021-02-08 11:20:40', '12.4', '5', '1'),
('2', 'Pâte carbo', 'Lardon, oignon, champignon...', 'asset/img/pate_carbo.jpeg', '2021-02-08 10:44:25', '2021-02-08 11:25:40', '12.4', '5', '2'),
('3', 'Burger poulet', 'Salade, tomate, oignon, champignon...', 'asset/img/burger.jpeg', '2021-02-08 10:50:00', '2021-02-08 11:55:40', '14.4', '6', '1'),
('4', 'Riz au lait', 'Riz, lait', 'asset/img/riz_au_lait.jpeg', '2021-02-08 10:55:25', '2021-02-08 11:59:40', '8.4', '5', '2'),
('5', 'Mouse au chocolat', 'Chocolat artisanal, oeuf bio', 'asset/img/mouse_chocolat.jpeg', '2021-02-08 11:44:20', '2021-02-08 11:50:47', '6.5', '6', '1');


