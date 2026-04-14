# Moteur de Blog - Conteneur MongoDB Personnalisé

Ce projet consiste en la création d'une image Docker personnalisée basée sur MongoDB, pré-configurée avec une base de données et des données de test pour un moteur de blog.

## Fonctionnalités
* **Image légère** : Basée sur `mongodb/mongodb-community-server:8.0-ubi8-slim`.
* **Sécurité** : Le conteneur s'exécute avec l'utilisateur non-privilégié `mongod`.
* **Intégrité** : Initialisation automatique de la base `blog_db` et de la collection `posts` avec un JSON Schema Validator (Champs: titre, auteur, vue).
* **Test automatisé** : Un script `check-status.sh` est fourni pour valider la viabilité du conteneur.

## Comment lancer le projet

1. **Cloner le dépôt**
2. **Créer un fichier `.env`** en se basant sur le fichier `.env.example`.
3. **Construire l'image** :
   `docker build -t mon-image-mongo:1.0.0 .`
4. **Lancer le conteneur** :
   `docker run -d --name TP2 --env-file .env mon-image-mongo:1.0.0`
5. **Tester la viabilité** :
   `./check-status.sh`
