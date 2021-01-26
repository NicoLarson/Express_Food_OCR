# Modeliser et implémenter une base de données relationnelle avec l'UML

## Appréhender les objets et le modèle relationnel

- Classe: Objet abstrait, concepte => entité du monde réel (ex: voiture, stylo...)

- Instance: Objet concret crée à partir de la classe

- Base de données relationnel

1. Identifier les classes
2. Modèliser les classes en UML: Classe + Attribut
3. Traduire dans un modèle physique de données

### Bien nommer!
- UML
        - Classes
                - au singulier
                - sans accent
                - commencer avec une majuscule
                - PascalCase
        - Attributs
                - singulier
                - sans accent
                - commencer avec une minuscule
                - camelCase
- MPD
        - Tables et attributs
                - au singulier
                - sans accent
                - minuscule
                - Underscore Case (_)


## Décrire le domaine fonctionnel avec le diagramm de classes UML
### Relations
- 11
- 1N
- NN

## Clés primaires
### Attribut id
- unique
### Clé primaire (PK)
- Unique et constant
- Servant de référence

## Mettre en relation avec les clés étrangères
### Asociation un à un (one to one)
```
Conducteur: idcond
Voiture: idvoit, #idcond
```
### Association un à plusieurs (one-to-many)
### Association plusieurs à plusieurs (many-to-many)
### Classe d'association

## Modéliser le domaine fonctionnel
### 1. Commencer par une ébauche
Représentation générale
Représenter que ce qui est utile
Relation simple
### 2. Modéliser précisément le domaine
Attribut
Relation avec multiplicité
### 3. Compléter le modèle
Ajouter les types de données: Bool, int, string, varchar...
### 4. Élaborer le modèle physique de données (MPD)
1. Crée une table par classe, hors association
2. Ajouter les attributs avec le type
3. Ajouter les clés primaires
4. Créer les relations entre les tables
5. Créer les relations correspondant aux classes d'association

## Optimiser le modèle relationnel avec les formes normales
Règle à respecter
### 1FN: Première forme normale
- Atomicité
### 2FN: deuxième forme normale
- Vérifie qu'aucun attribut non clé primaire ne dépend que d'une partie de la clé primaire.
- Clé primaire composite
- Tous les attribues doivent faire partie de la clé primaire
### 3FN: Troisième forme normale
- aucun attribut ne faisant pas partie de la clé primaire ne doit dépendre d'une partie des autres attributs ne faisant pas non plus partie de la clé primaire.

## Améliorer la modélisation objet
### Agrégation et composition
~ comporte ou est composé de
#### Agrégation
#### Composition
### Héritage
Approche orientée objet
Avec l'héritage, on peut 
        - placer des attributs commun (super-classe), qui seront automatiquement repris dans les sous-classes
        - créer des associations communes au niveau de la super-classe qui seront automatiquement reprises dans les sous-classe
Composition => matérialiser le fait qu'une instance de classe est composée d'instances d'autre classes
Association réflexive => créer une arborescence d'instances d'une classe

### Association réflexive
Lorsque 2 extrémité pointent sur la même classe

> Mots Clés: agrégation, composition, héritage, associations réflexives


## Conclusion
- Une instance d'objet == une ligne dans une table
- Une association entre deux classes peut être caractérisée par
        - des rôles
        - des noms
        - des multiplicités
        - un losange
        - un nom
- Plusieurs à plusieurs (many-to-many) nécessite la création d'un table supplémentaire pour faire un lien entre les tuples
- Une clé primaire
        - permet d'identifier un tuple de manière unique
        - peut être composée de plusieurs colonnes
- On ajoute des attributs sur une association en créant une classe d'association
- La valeur d'une clé étrangère ne correspond pas au numéro de la ligne liée
- L'héritage en approche orientée objet permet de
        - de généraliser des comportements et des attributs
        - de généraliser des associations
      



## Choisir un système de gestion de base de données
> Comment obtenir une base de données à partir d'un modèle physique de données?
1. Décrire le modèle fonctionnel à partir du diagramme de classe
2. Élaborer un modèle physique de données
3. Générer un script SQL permettant la création de la base
4. Utiliser ce scripte sur le gestionaire de base de données pour crée la base
5. Inporter les données à l'aide de requettes SQL

### Installation postgresql sur arch linux

```bash
sudo pacman -Sy postgresql
sudo -iu postgres
# Pour initialiser les fichiers de conf et autre data
initdb -D /var/lib/postgres/data
```
> /var/lib/postgres/data/postgresql.conf

systemctl start postgresql.service

### Installer SQL Power Architect
### Installer squirrel-sql
Pour faire des requêtes
#### Installer driver postgresql
[Télécharger le driver](https://jdbc.postgresql.org/download.html)
1. Onglet driver
2. Double click sur PostreSQL
3. Dans Extra Class Path ajouter le driver téléchargé
4. Cliquer sur List Driver

### Remarque
- Mettre trop d'index fera ralentir l'écriture dans la table
- "nullable": Elle accepte la valeur NULL
- On peut imposer une contrainte d'unicité de valeur dans une colonne de la table autre que la clé primaire en ajoutant un index qualifié unique sur cette colonne.

## CRUD
Create Read Update Delete 
### Create
```sql
INSERT
```
### Read
```sql
SELECT
```

### Update
```sql
UPDATE
```
### Delete
```sql
DELETE
```

### Transactions
On ouvre une transaction avec:
```sql
BEGIN TRANSACTION;
```
On cloture une transaction avec:
```sql
COMMIT; /* pour valider */
/* ou */
ROLLBACK; /* pour annuler */
```

