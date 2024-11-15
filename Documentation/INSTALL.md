## Guide Administrateur

### Sommaire
- [1. Introduction](#1-introduction)
- [2. Prérequis techniques](#2-prérequis-techniques)
- [3. Installation et configuration](#3-installation-et-configuration)
  - [Configuration du script PowerShell sur Windows Server](#configuration-du-script-powershell-sur-windows-server)
  - [Configuration du script shell sur Debian](#configuration-du-script-shell-sur-debian)
  - [Configuration des machines clientes (Windows)](#configuration-des-machines-clientes-windows)
  - [Configuration des machines clientes (Ubuntu)](#configuration-des-machines-clientes-ubuntu)
  - [Vérification de la configuration](#vérification-de-la-configuration)
- [4. FAQ](#4-faq)
- [5. Conclusion](#5-conclusion)

### 1. Introduction
- Objectif du projet

### 2. Prérequis techniques
- Configuration requise des machines (serveur et clientes)

| Type machine | Nom | Système d'exploitation | Compte | Adresse IP fixe |
| :---: | :---: | :---: | :---: | :---: |
Client | CLIWIN01 | Windows 10 | utilisateur wilder | 172.16.10.20/24
Client | CLILIN01 | Ubuntu 22.04/24.04 LTS | utilisateur wilder | 172.16.10.30/24
Serveur | SRVWIN01 | Windows Server 2022 | Administrator | 172.16.10.5/24
Serveur | SRVLIX01 | Debian 12 | root | 172.16.10.10/24

### 3. Installation et configuration
#### Configuration du script PowerShell sur Windows Server
- Détails de la configuration

#### Configuration du script shell sur Debian
- Détails de la configuration

#### Configuration des machines clientes (Windows)
- Détails de la configuration

#### Configuration des machines clientes (Ubuntu)
- Détails de la configuration

#### Vérification de la configuration
- Détails de la vérification
- Points de vigilance pour assurer une configuration correcte

### 4. FAQ
#### Problèmes courants
Les problèmes courants dans le scripting Bash et PowerShell pour l'automatisation de tâches à distance incluent des erreurs de connexion réseau, des permissions insuffisantes, des conflits de versions de script sur les différentes machines, et des problèmes de compatibilité entre les systèmes d'exploitation.

#### Solutions simples
Voici des solutions simples pour les problèmes courants dans les scripts d'automatisation à distance :

- Erreurs de connexion réseau : vérifiez que les machines peuvent se "pinguer" entre elles et que les bons ports sont ouverts.
- Permissions insuffisantes : assurez-vous que l'utilisateur a les droits nécessaires pour exécuter les scripts à distance.
- Problèmes de compatibilité entre systèmes d'exploitation : utilisez des scripts compatibles avec plusieurs systèmes ou séparez les scripts pour chaque OS.
- Erreurs de syntaxe et de logique : testez les scripts localement avant de les exécuter à distance.
- Problèmes de variables et d'environnement : vérifiez que les variables nécessaires sont définies correctement sur chaque machine.

### 5. Conclusion
- Récapitulatif des points clés
- Contacts pour l'assistance
- Ressources supplémentaires
