# Unified Modeling Language
> mots clés: Entités, Attributs, Relations

- Ne pas se lancer tête baissée dans la conception
- Collaborer avec l'Event Storming
- Utiliser un language universel
- Identifier les acteurs et les cas d'utilisation
- Générer des diagrammes UML
- Adapter le programme aux besoins du client

## I - Identifier les besoins d'utilisateurs: méthode Domain-Driven Design
### Modèle de domaine
- Représentation conceptuelle des éléments clés (compris par tous)
- Contextes délimités (boundedcontext)
- Chaque domaine a un point de vue unique
- Basée sur le client ou descendante
        - quoi
        - pourquoi
- Comprendre la terminologie et le contexte

### Découvrir à quoi ressemblent les modèles de domaine
- Diagrammes
- Domain Driven Design


### Domain-Driven Design
- Modèle de domaine en constante évolution
#### Recueillir des informations au près de différentes parties
- Pour qui suis je entrain de concevoir cette application?
- Que veulent-ils réaliser?
##### Etape 1: Identifier les utilisateurs de l'application
##### Etape 2: Entamer la conversation
##### Etape 3: Poser des questions complémentaires

#### Appropriez vous le language du domaine
Se mettre d'accord sur la signification des principaux termes ou concept.
#### Ajuster le modèle à la bonne échelle

### Identifier les objectifs de l'app avec l'Event Storming
- Atelier qui réunis les acteurs pour faire l'app
- Etapes:
        - Def l'objectif de l'Event Storming
        - Choisir les personnes adéquates, le lieux et le bon momment
        - Démarrer avec une idée et laisser évoluer
         Tous sera retranscrit dans le modèle de domaine
### Identifier les acteurs, les cas d'usage et les entités du modele du client
- Les acteurs: sont les utilisateurs de l'application
- Les cas d'utilisation (use cases): sont les objectifs que les acteurs veullent atteindre
        - Rédiger les cas d'utilisatio de plus en plus detaillé
- Les entités: Déterminer les entités en analysant les descriptions des cas d'utilisation.

## Récap
- DDD : mieux comprendre le point de vue du futur utilisateur
- Cas d'utilisation: décrivent l'objectif à accomplir par le programme pour un acteur (énumère objectif d'un utilisateur). Pas de détails de mise en oeuvre tant qu'ils ne sont pas développés dans des descriptions de cas d'utilisation.
- Les entités sont des éléments à longue durée de vie qui sont essentiels à l'execution du programme
- Les sessions d'event storming sont des exercice de collaboration qui explore le système du point de vue des entreprises et de leurs besoins.
- Un domaine est un domaine d'activité
- Language omniprésent: utiliser la même terminologie partout
- Modèle de domaine: ensemble d'entités, de valeurs et d'agrégats
- Les déclancheurs indiquent la raison buisness pour laquelle il faut commencer à exécuter une fonctionnalité

## II - Formaliser les besoins des utilisateurs
### Concevoir un diagramme de cas d'utilisation
1. Identifier les acteurs
2. Définir les cas d'utilisation
3. Ajouter les relations
### Définir un glossaire commun à partir d'un diagramme de classes
Commencer par la description du cas d'utilisation
Trouver les idées importantes (classes) et les idées moins importantes (attribut de classes)
1. Identifier les noms
2. Représenter les noms en tant que classes ou attributs
### Adapter le diagramme aux changements des besoins du client
Créer les description s des nouveaux cas d'utilisation
#### Mettre à jour le diagramme de cas d'utilisation
#### Mettre à jour le diagramme de classe
### Implémenter le modèle de domaine
1. Prêter attention aux frontières
2. Définir des entités pour représenter des objets uniques
3. Identifier les objets valeurs dans le modèle
4. Identifier les objets d'agrégation

- Entités: uniques dans le système
- Objets valeurs: pas de caractère unique
- Agrégats: regroupent une entté et un objet valeur, pour finaliser un cas d'utilisation

## Récap
- On peut représenter les modèles de domaine:
        - avec un diagramme de classes
        - avec un diagramme de cas d'utilisation
        - avec une série de page wiki
- Première étape de création d'un diagramme de classe: Générer des descriptions de cas d'utilisation en se basant sur le diagramme de cas d'utilisation.
- Agrégats: regroupent une entité et un objet valeur pour finaliser un cas d'utilisation
- Une diagramme de cas d'utilisation représente les utilisateurs du système et ce que les utilisateurs veulent que le système fasse.
- Un diagramme de classe représente les classe qui peuvent être implémentées dans un système, et les relations entre elles.
- Un diagramme de cas d'utilisation est généré plus tôt dans le processus et peut informer sur la façon dont le diagramme de classe sera conçu.

