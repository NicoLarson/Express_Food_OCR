# Diagrammes de sequence

> Objectif: Représenter les communications avec et au sein du logiciel

- Représentation **temporelle** des interactions entre les objets.
- **Chronologie** des messages échangés entre les objets et avec les acteurs.

## En conception
Réalisation des cas d'utilisation sur le système représenté par le diagramme de classes.
- Point de vue interne sur le fonctionnement du système
- Description au niveau de l'instance(état du système)
- Description de scénarios particuliers
- Représentation des échanges de messages
        - entre les acteurs et le système, entre les objet du système
        - de facon chronologique
## Éléments du diagramme de séquence

- Acteurs
- Objets (instances)
- Messages (cas d'utilisation, appels d'opération)

## Principe de base
> Représentation graphique de la chronologie des échanges des messages avec le système ou au sein du système.
- "Vie" de chaque entité représentée verticalement
- Échanges de messages représentés horizontalement

MESSAGE == Méthode de classe
        - Numéroté de manière vertical
        - Le temps pris par
        - Représenté par desflèches
        - Plusieurs types
                - Synchrone
                - Asynchrone
                - Simple
                - reflexif
LIGNES DE VIE == OBJETS et ACTEURS


## Représentation des lignes de vie
[<nom_du_rôle>]:[<Nom_du_type>]
## Représentation des messages
- L'envoi d'un signal
- L'invocation d'une opération
- La création ou la destruction d'une instance

### Messages asynchrones
- Pas d'interuption 
- n'attend pas de réponse
### Messages synchrones
- Éméteur reste bloqué tant qu'il n'a pas de réponses
### Messages de création et destruction d'instance

### Événements et messages
![messages asynchrone](https://laurent-audibert.developpez.com/Cours-UML/images/fig7_10.png)
UML permet de séparer l'envoi du message, sa réception et le début de l'éxécution la rédaction et sa fin

### Syntaxe des messages et des réponses
> [<attribut> = ] message [ : <valeur_de_retour>]

**message** représente le message d'envoi.
![execution avec une réponse](https://laurent-audibert.developpez.com/Cours-UML/images/fig7_11.png)

### Message perdu et trouvé
### Porte
Une porte est un point de connection qui permet de représenter un même message dans plusieurs fragments d'interaction. Ces messages entrant et stortants vont d'un bord d'un diagramme à une ligne de vie (ou l'inverse).
### Exécution de méthode et objet actif

## Fragments d'interaction combinés
Fragment combiné => articulations d'interactions.
Il est défini par un opérateur et des opérandes.
- opérateurs de choiw et de boucle: alternative, option, break, loop;
- opérateurs contrôlant l'envoi en parallèle de messages: parallel et critical region;
- opérateurs contrôlant l'envoi de messages: ignore, consider, assertion et negative;
- opérateurs fixant l'ordre d'envoi des messages: weak sequencing, strict sequencing.

### Opérateur alt

### Opérateurs opt

### Opérateur loop
> loop[ '('<minInt> [ ',' <maxInt>] ')']


### Opérateur par

### Opérateur strict

## Utilisation d'interaction
