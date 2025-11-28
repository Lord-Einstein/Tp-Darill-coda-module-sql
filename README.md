# TP Darill PostgreSQL - Module SQL

## Pré-requis

### 1. Terminal

Assurez-vous d'avoir accès à un terminal :
- **macOS** : Terminal (pré-installé) ou iTerm2
- **Windows** : PowerShell, Git Bash, ou Windows Terminal
- **Linux** : Terminal de votre distribution

### 2. Git

Git doit être installé sur votre machine :

- **macOS** : 
  ```bash
  # Vérifier si Git est installé
  git --version
  
  # Si non installé, installer via Homebrew
  brew install git
  ```

- **Windows** : Téléchargez et installez [Git pour Windows](https://git-scm.com/download/win)

- **Linux** :
  ```bash
  # Debian/Ubuntu
  sudo apt-get install git
  
  # Fedora
  sudo dnf install git
  ```

Vérifiez l'installation :
```bash
git --version
```

### 3. Cloner ce repository

```bash
git clone git@github.com:lgauthier1/coda-module-sql.git
cd coda-module-sql
```

Si vous n'avez pas encore configuré le remote :
```bash
git remote add origin git@github.com:lgauthier1/coda-module-sql.git
```

### 4. Installer Docker

Assurez-vous d'avoir Docker installé sur votre machine :

- **macOS** : Téléchargez et installez [Docker Desktop pour Mac](https://www.docker.com/products/docker-desktop)
- **Windows** : Téléchargez et installez [Docker Desktop pour Windows](https://www.docker.com/products/docker-desktop)
- **Linux** : Suivez les instructions sur [docs.docker.com](https://docs.docker.com/engine/install/)

Vérifiez l'installation :
```bash
docker --version
docker-compose --version
```

### 5. Client PostgreSQL

**Option 1 : pgAdmin via Docker (recommandé)**

## Démarrage de la base de données

### Option 1 : PostgreSQL seul (recommandé si problème avec pgAdmin)

```bash
docker-compose up -d
```

### Initialiser le schéma et les données

Les scripts qui doivent être exécutés manuellement après le premier démarrage :

```bash
# 1. Créer le schéma et les tables
docker-compose exec -T postgres psql -U codaSchoolUser -d codaSchool < scripts/schema.sql

# Vérifier que les tables ont été créées
docker-compose exec postgres psql -U codaSchoolUser -d codaSchool -c "SELECT tablename FROM pg_tables WHERE schemaname = 'beerproject';"

# 2. Charger les données de test
docker-compose exec -T postgres psql -U codaSchoolUser -d codaSchool < scripts/seed.sql

# Vérifier que les données ont été insérées
docker-compose exec postgres psql -U codaSchoolUser -d codaSchool -c "SET search_path TO beerproject; SELECT COUNT(*) FROM quartier; SELECT COUNT(*) FROM bar; SELECT COUNT(*) FROM biere; SELECT COUNT(*) FROM prix;"
```

La base de données sera accessible avec les paramètres suivants :
- **Host** : `localhost`
- **Port** : `5433`
- **Database** : `codaSchool`
- **Username** : `codaSchoolUser`
- **Password** : `verySecretAndSecurePassword`

### Vérifier que le conteneur fonctionne

```bash
docker-compose ps
```

### Arrêter la base de données

```bash
docker-compose down
```

### Arrêter et supprimer les données

```bash
docker-compose down -v
```
