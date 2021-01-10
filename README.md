# ExpressFood

Livrer des plats de qualité en moins de 20 minutes grâce à un réseau de livreurs à vélo.

2 plats 2 desserts froid
Frais de livraison gratuits

APP:
- Propose plats desserts
- Les plats changesnt chaque jour
- Page indiquant si un livreur à pris la commande et l'estimation de livraison

BDD:
- Liste des clients
- Liste des différents plats du jour
- Liste des livreurs, avec leur statut et leur position
- Liste des commandes passées

## TODO

- [ ] UML
- [ ] Diagrammes besoins application (cas d'utilisation)
- [ ] Création d'une commande
- [ ] Ajout d'un plat du jour
    - [ ]  Livraison d'une commande
- [ ]  Diagramme de classe (entités application)
    - [ ] Diagramme de séquences 
    - [ ] Création d'une commande
    - [ ] Ajout d'un plat du jour
    - [ ] Livraison d'une commande
    - [ ] Schéma de BDD MySQL
- [ ] Remplir la base (valeurs fictives)

## UML: Analyse
        - Acteurs:
        - Chefs
        - Elaboration de plats
        - Publier les nouveaux plats
        - Ingredient
        - Prix
        - Livreur
        - Livraison de plats
        - Afficher la position
        - Afficher la prise de commande
        - Confirmation de dépots de commande
        - Client
        - Prise de commande
        - Paiement
        - Pleintes
        - Réclamation

### 1. Utilisateurs
        - Livreur
        - Client
### 2. Converser
        Dev: "Que souhaitez-vous pouvoir faire?"
        Client: "Je souhaite être livrer en moins de 2O minutes un repas"
        Dev: "Celon vous comment dois je procéder?"
        Client: "J'ouvre l'application je vois le plats proposer, je séléctionne les plats que je veux, je confirme et je me fait livrer. Bien sur en amont j'aurai un compte avec CB et tous."
        Dev: "Comment vous les vous être prévenu quand il sera disponible?"
        Client: "Un appel. Et avoir la possibilité de suivre l'avancement de la livraison."
### 3. Plus de questions
### Languages
        Livraison
        Plats
        Courses
## Identifications
### Utilisateur de l'application
#### Étape 1: Identifier les acteurs
- Clients
- Livreurs
- Cuisinier
#### Étape 2: Identifier les cas d'utilisation
- Choisir un plat
- Acheter un plat
- Préparer la commande
- Prévenir que la commande est prête à être livrer
- Prévenir que la commande est en cours de livraison
- Vérifier l'état de livraison
- Confirmer la livraison
- Confirmer la reception de la livraison

- Cuisinier
        - Création des plats
        - Préparation des plats
        - Conditionnement des plats
        - Prévenir que le plats est prêt à être livré

- Livreur
        - Récupération des plats
        - Mise a jour du status
        - Prise en compte d'une commande
        - Livrer
        - Confirmer la livraison

- Client
        - Choisir un ou des plats
        - Payer la commande
        - Confirmer la reception de la livraison 

#### Étape 3: Relier le tout avec les relations
- Acheter un plat -> Prévenir que la commande est prête à être livrer -> Prévenir que la commande est en cours de livraison
- Confirmer la livraison -> Confirmer la reception de la livraison

### Glossaire commun: diagramme de classes
#### Étape 1: Identifier les noms
- Le **client** choisi un **plat**
- Le **programme** affiche le detail du **plat**
- Le **client** passe la **commande**
- Le **client** paie la **commande**
- La **commande** est envoyé au **livreur**
- Le **livreur** confirme la reception de la **commande**
- Le **livreur** livre la **commande**
- Le **client** réceptionne la **commande**
- Le **client** confirme la reception de la **commande** au **programme**
- Le **livreur** confirme la **livraison** de la **commande** au **programme**
#### Étape 2: représenter les noms en tant que classes ou attributs


