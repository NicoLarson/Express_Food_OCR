drop table if exists compte;
drop table if exists client;
drop table if exists cuisinier;
drop table if exists livreur;
drop table if exists plat;
drop table if exists client_adresse;
drop table if exists commande_adresse;

CREATE TABLE compte
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
type VARCHAR(255) NOT NULL
);

CREATE TABLE client 
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(255) NOT NULL,
mail VARCHAR(255) NOT NULL,
mdp VARCHAR(255) NOT NULL,
tel VARCHAR(255) NOT NULL,
idcompte INT NOT NULL,
FOREIGN KEY (idcompte) REFERENCES compte (idcompte)
);

CREATE TABLE client_adresse (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  adresse VARCHAR(255) NOT NULL,
  ville VARCHAR(255) NOT NULL,
  cp VARCHAR(255) NOT NULL,
  pays VARCHAR(255) NOT NULL,
  info_livraison VARCHAR(255) NOT NULL
);

CREATE TABLE livreur 
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(255) NOT NULL,
mail VARCHAR(255) NOT NULL,
mdp VARCHAR(255) NOT NULL,
tel VARCHAR(255) NOT NULL,
statu VARCHAR(255) NOT NULL,
position VARCHAR(255) NOT NULL,
nb_plat INT NOT NULL,
idcompte INT NOT NULL,
FOREIGN KEY (idcompte) REFERENCES compte (id)
);

CREATE TABLE commande (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  date_paiement TIMESTAMP NOT NULL,
  date_creation TIMESTAMP NOT NULL,
  date_livraison TIMESTAMP NOT NULL,
  prix FLOAT NOT NULL,
  idlivreur INT NOT NULL,
  idplat INT NOT NULL,
  FOREIGN KEY (idlivreur) REFERENCES livreur (id),
  FOREIGN KEY (idplat) REFERENCES plat (id)
);

CREATE TABLE commande_adresse (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  adresse VARCHAR(255) NOT NULL,
  ville VARCHAR(255) NOT NULL,
  cp VARCHAR(255) NOT NULL,
  pays VARCHAR(255) NOT NULL,
  info_livraison VARCHAR(255) NOT NULL
);


CREATE TABLE cuisinier
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(255) NOT NULL,
mail VARCHAR(255) NOT NULL,
mdp VARCHAR(255) NOT NULL,
tel VARCHAR(255) NOT NULL,
idcompte INT NOT NULL,
FOREIGN KEY (idcompte) REFERENCES compte (id)
);

CREATE TABLE plat (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  details VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL,
  date_publication TIMESTAMP NOT NULL,
  date_conditionnement TIMESTAMP NOT NULL,
  prix FLOAT NOT NULL,
  idcuisinier INT NOT NULL,
  FOREIGN KEY (idcuisinier) REFERENCES cuisinier (id) 
);

INSERT INTO compte 
VALUES
(1, "client"),
(2, "client"),
(3, "client"),
(4, "livreur"),
(5, "livreur"),
(6, "livreur"),
(7, "cuisinier"),
(8, "cuisinier");

INSERT INTO client (id, nom, mail, mdp, tel, compte_id , clients_adresse_id)
VALUES 
(1, "Robert", "robert@gmail.com", "azerty", 0102030405,1,1),
(2,  "Gertrude", "gg@yahoo.com", "azeqsd", 12345678,2,2),
(3, "Andre", "adreedu88@hotmail.fr", "wxcqsdaze", 124578454512,3,3);

INSERT INTO livreur (nom, mail, mdp, tel, statu)
VALUES 
(Valérie, "vava@hotmail.com", poipoi, 12453265, libre),
(Henri, "henri@gmail.fr", qsdqsdqsd, 987654321, libre),
(Barry, "barry@hotmail.com", azeqsdwxc, 321654654, libre);

INSERT INTO cuisinier (nom, mail, mdp, tel)
VALUES 
(Gusto, "gugus@gmail.com", azeqsd12, 132456789),
(Paul, "paul@gmail.com", aqwzsxedc, 132456789);

INSERT INTO client_adresse (id,adresse, ville, cp , pays)
VALUES
(1,"8 rue Clérie", "Paris", 75002, "France"),
(2,"(22 rue du chateau", "Paris" , 75008, "France"),
(3,"44 rue des commerçants", "Paris", 75011, "France");

INSERT INTO commande (date_paiement, date_creation, date_livraison, prix)
VALUES
(2021-01-30, 2021-01-30, 2021-01-30, 56.5),
(2021-02-01, 2021-02-01, 2021-02-01, 32),
(2021-02-02, 2021-02-02, 2021-02-02, 41.8);


INSERT INTO commande_adresse (adresse, ville, cp , pays)
VALUES
("8 rue Clérie", Paris, 75002, France),
("22 rue du chateau", Paris , 75008, France),
("44 rue des commerçants", Paris, 75011, France);


INSERT INTO plat (nom, details, image, date_publication, date_conditionnement, prix)
VALUES
("Pâtes carbo", "Pâtes crème fraîche lardons oignons champignons", "asset/img/plat/pate_carbo.jpeg", 2021-01-30, 2021-01-30, 11.4),
("Risoto au fruits de mer", "Risoto parmesant oignons bio ails bio moules calamars", "asset/img/plat/risoto_fruit_de_mer.jpeg", 2021-01-30, 2021-01-30, 16.4),
("Fondant au chocolat"," farine sans gluten et chocolat fait maison", "asset/img/dessert/fondant_choco.jpeg", 2021-01-30, 2021-01-30, 8),
("Riz au lait"," Riz lait cannelle vanille indonésienne", "asset/img/dessert/riz_au_lait.jpeg", 2021-01-30, 2021-01-30, 7.5);


TODO
Faire les relations diagramme de classe.




