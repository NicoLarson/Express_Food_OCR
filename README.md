# Concevez la solution technique d'une application de restauration en ligne, ExpressFood

Vous venez d'être recruté par la toute jeune startup ExpressFood. Elle ambitionne de livrer des plats de qualité à domicile en moins de 20 minutes grâce à un réseau de livreurs à vélo.

Chaque jour, ExpressFood prépare 2 plats et 2 desserts.
Les frais de livraison sont gratuits.

ExpressFood a besoin que vous conceviez sa base de données. Il s'agit de stocker notamment :
- La liste des clients
- La liste des différents plats du jour
- La liste des livreurs, avec leur statut (libre, en cours de livraison) et leur position
- La liste des commandes passées
...

Schémas demandés :
- Diagrammes de cas d’utilisation (création d’une commande, ajout d’un plat du jour, livraison d’une commande)
- Modèle de données
- Diagramme de classes
- Diagrammes de séquences (création d’une commande, ajout d’un plat du jour, livraison d’une commande)

---
## Conceptions de la base de données
### Diagrammes de cas d'utilisations
1. Identifier les acteurs
2. Définir les cas d'utilisations
3. Ajouter les relations

![](https://github.com/NicoLarson/Express_Food_OCR/blob/main/img/Diagramme_de_cas_d_utilisations.png)

[Diagrammes_de_cas_d'utilisations.pdf](https://github.com/NicoLarson/Express_Food_OCR/blob/main/pdf/Diagrammes_de_cas_d_utilisations.pdf)
### Diagrammes des séquences
#### Éléments du diagramme de séquences
- Acteurs
- Objets (instances)
- Messages (cas d'utilisation, appels d'opération)

#### Principe de base
Représentation graphique de la chronologie des échanges des messages avec le système ou au sein du système.
- "Vie" de chaque entité représentée verticalement
- Échanges de messages représentés horizontalement
- Représentation **temporelle** des interactions entre les objets.
- **Chronologie** des messages échangés entre les objets et avec les acteurs.

![](https://github.com/NicoLarson/Express_Food_OCR/blob/main/img/Diagramme_de_sequences.png)
[Diagrammes_de_séquences PDF](https://github.com/NicoLarson/Express_Food_OCR/blob/main/pdf/Diagrammes_de_sequences.pdf)
### Diagramme de classes
#### Modéliser le domaine fonctionnel
1. Commencer par une ébauche
    - Représentation générale
    - Représenter que ce qui est utile
    - Relation simple
2. Modéliser précisément le domaine
    - Attribut
    - Relation avec multiplicité
3. Compléter le modèle: Ajouter les types de données: Bool, int, string, varchar...
4. Élaborer le modèle physique de données (MPD)
1. Créer une table par classe, hors association
2. Ajouter les attributs avec le type
3. Ajouter les clés primaires
4. Créer les relations entre les tables
5. Créer les relations correspondant aux classes d'association

![](https://github.com/NicoLarson/Express_Food_OCR/blob/main/img/Diagramme_de_classes.png)
[Diagramme_de_classes.pdf](https://github.com/NicoLarson/Express_Food_OCR/blob/main/pdf/Diagramme_de_classes.pdf)
### Modèle de données
Décrire le modèle fonctionnel à partir du diagramme de classes

![](https://github.com/NicoLarson/Express_Food_OCR/blob/main/img/Modele_de_donnes.png)
[Modèle_de_données.pdf](https://github.com/NicoLarson/Express_Food_OCR/blob/main/pdf/Modele_de_donnees.pdf)

### Script base de données SQL
```sql
...
CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`compte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  `nom` VARCHAR(255) NOT NULL,
  `mdp` VARCHAR(255) NOT NULL,
  `mail` VARCHAR(255) NOT NULL,
  `tel` VARCHAR(20) NOT NULL,
  `statut` VARCHAR(255) NULL,
  `position` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `EXPRESSFOOD`.`commande` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_creation` DATETIME NOT NULL,
  `date_paiement` DATETIME NULL,
  `date_livraison` DATETIME NULL,
  `statut_livraison` VARCHAR(255) NULL,
  `prix` INT NOT NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_commande_compte1_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_commande_compte1`
    FOREIGN KEY (`client_id`)
    REFERENCES `EXPRESSFOOD`.`compte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
...

```

[Base_de_données.sql](https://github.com/NicoLarson/Express_Food_OCR/blob/main/Base_de_donnees.sql)

---
## Support de présentation
[Support_de_présentation.pptx](https://github.com/NicoLarson/Express_Food_OCR/blob/main/Presentation.pptx?raw=true)

> Nicolas Yang - 2021

