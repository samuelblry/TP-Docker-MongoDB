# Conteneurisation MongoDB - Moteur de Blog

## Description du projet
Ce projet consiste à créer une image Docker personnalisée pour MongoDB, configurée pour un moteur de blog. Il met en œuvre des mécanismes d'initialisation automatique, de sécurité et de validation de données.

### Fonctionnalités principales
* **Initialisation automatique** : Création de la base de données `blog_db` et de la collection `posts` au premier lancement.
* **Intégrité des données** : Mise en place d'un **JSON Schema Validator** sur la collection `posts`. Toute insertion dont les types de champs (`titre`, `auteur`, `vue`) sont incorrects est rejetée par la base.
* **Sécurité** : 
    * Utilisation d'une image de base légère (`8.0-ubi8-slim`).
    * Exécution via un utilisateur non-privilégié (`mongod`) pour interdire l'usage de `root`.
    * Gestion des secrets par variables d'environnement.
* **Vérification de viabilité** : Script Bash `check-status.sh` pour tester automatiquement la conformité du conteneur depuis la machine hôte.

---

## Structure du dépôt
```text
├── docker-entrypoint-initdb.d/
│   └── init.js         # Script d'initialisation de la base et du validateur
├── screen/             # Captures d'écran (Preuves de fonctionnement)
│   ├── CP Fail.png     # Échec d'insertion (Validation de schéma)
│   ├── CP OK.png       # Succès du script check-status.sh
│   └── CP PS.png       # État du conteneur et utilisateur
├── .env.example        # Modèle pour les variables d'environnement
├── check-status.sh     # Script de test de viabilité
├── Dockerfile          # Instructions de construction de l'image
└── README.md           # Documentation du projet
```

---

## Installation et Utilisation

### 1. Préparation de l'environnement
Copiez le fichier `.env.example` vers un nouveau fichier `.env` et définissez vos identifiants administrateur :
```bash
cp .env.example .env
```

### 2. Construction de l'image
Générez l'image locale avec le tag approprié :
```bash
docker build -t tp2-mongo:1.0.0 .
```

### 3. Lancement du conteneur
Démarrez le service en arrière-plan en utilisant le fichier d'environnement pour la configuration sécurisée :
```bash
docker run -d --name TP2 --env-file .env tp2-mongo:1.0.0
```

### 4. Exécution des tests de viabilité
Lancez le script de vérification pour confirmer que le service est opérationnel et sécurisé :
```bash
chmod +x check-status.sh
./check-status.sh
```

---

## Preuves de fonctionnement (Livrables)

### Validation du statut (Check-status)
Le script confirme que l'utilisateur n'est pas root et que les données sont accessibles.

![Succès Check-status](screen/CP%20OK.png)

### Test du Validateur de Schéma
Preuve que la base rejette une insertion ne respectant pas les types définis (ex: texte dans un champ numérique).

![Échec Insertion](screen/CP%20Fail.png)

### Inspection du conteneur
Résultat de la commande `docker ps` et vérification de l'utilisateur interne.

![Docker PS et User](screen/CP%20PS.png)

---
**Dépôt GitHub :** [https://github.com/samuelblry/TP-Docker-MongoDB](https://github.com/samuelblry/TP-Docker-MongoDB)  
**Image Docker Hub :** `samuelblry/tp2-mongo:1.0.0`
