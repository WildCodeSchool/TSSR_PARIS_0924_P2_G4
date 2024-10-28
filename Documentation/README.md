## TSSR_PARIS_0924_P2_G4

### Présentation du projet et objectifs finaux

Le projet consiste à créer un script qui s’exécute sur une machine et effectue des tâches sur des machines distantes. L’ensemble des machines sont sur le même réseau.
> Depuis une machine Windows Server, on exécute un script PowerShell qui cible des ordinateurs Windows.

> Depuis une machine Debian, on exécute un script shell qui cible des ordinateurs Ubuntu.

### Introduction et mise en contexte

Le projet permet de disposer d'une documentation métier permettant de : 
- Mettre en place une architecture client/serveur
- Créer et gérer des scripts bash et PowerShell
- Comprendre toutes les étapes
- Faire une démonstration de la réalisation finale

### Membres du groupe de projet et rôle par sprint

| Sprint hebdomadaire vs rôle | BENZAI Walid | CLERY Alexandra | KONATE Mamadou | 
| :---: | :---: | :---: | :---: | 
21/10/24 au 27/10/24 | Scrum Master | Product Owner | Scrum Master 
28/10/24 au 03/11/24 | Product Owner | Scrum master | Scrum Master  
04/11/24 au 10/11/24 | Scrum Master | Scrum Master | Product Owner 
12//11/24 au 15/11/24 |  Scrum Master | Product Owner | Scrum Master 

### Choix techniques

| Type machine | Nom | Système d'exploitation | Compte | Adresse IP fixe |
| :---: | :---: | :---: | :---: | :---: |
Client | CLIWIN01 | Windows 10 | utilisateur wilder | 172.16.10.20/24
Client | CLILIN01 | Ubuntu 22.04/24.04 LTS | utilisateur wilder | 172.16.10.30/24
Serveur | SRVWIN01 | Windows Server 2022 | Administrator | 172.16.10.5/24
Serveur | SRVLIX01 | Debian 12 | root | 172.16.10.10/24

### Arborescence du menu proposé

- Souhaitez-vous réaliser une action dans le système (A) ou obtenir une information du système (I) ?
- Si A =
    > Souhaitez-vous réaliser une action sur un utilisateur (U) ou sur un Ordinateur client (O) ?
- Si A + U (action + utilisateur) = 
    > Souhaitez-vous créer (C) ; supprimer (S) ; désactiver (D) un compte utilisateur local ? >>> MAMADOU
    
    > Souhaitez-vous effectuer un changement de mot de passe (M) ? >>> WALID
    
    > Souhaitez-vous ajouter ou sortir un utilisateur d'un groupe (G) ? >>> ALEXANDRA 
- Si A + O (action + ordinateur) =
    > 

### Difficultés rencontrées et solutions trouvées

| Difficultés | solutions |
| :--- | :--- |
xxx | xxx  
xxx | xxx 
xxx | xxx

### Améliorations possibles et suggestions d’améliorations futures

xxx 
