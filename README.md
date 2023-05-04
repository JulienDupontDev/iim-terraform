# Terraform GCP - IIM Julien Dupont

## Prérequis
# tout en français, explique les différentes étapes pour pouvoir lancer le projet depuis le shell google cloud
- Avoir un compte Google Cloud Platform
- Avoir un projet
- Avoir créé un compte de facturation (https://console.cloud.google.com/billing)
- Avoir rélié le projet à la facturation (https://cloud.google.com/billing/docs/how-to/modify-project)


## Installation

- Ouvrir le shell Google Cloud Platform (https://console.cloud.google.com/home/dashboard?cloudshell=true)

- Cloner le projet
```bash
git clone https://github.com/JulienDupontDev/iim-terraform.git
```

- Se déplacer dans le dossier du projet
```bash
cd iim-terraform
```

- Installer les dépendances de la fonction
```bash
npm install
```

- Passer l'ID du projet en variable d'environnement
```bash
export project=$(gcloud config get-value project)
```

- Initialiser Terraform (entrer "yes" quan demandé)
```bash

terraform init --backend-config="project=terraform-301013"
```

- Vérifier que tout est ok
```bash
terraform plan
```

- Lancer le déploiement
```bash

terraform apply
```

## Accéder à la fonction 

- Aller dans la console Google Cloud Platform (https://console.cloud.google.com/functions/list)

- Cliquer sur la fonction

- Cliquer sur "Déclencheur"

- Copier le lien et l'ouvrir dans un autre fenêtre en ajoutant "/status" à la fin de l'url


## Structure du projet tree form

```bash
.
├── src # code source JS de la fonction
│   ├── index.js
│   ├── package-lock.json
│   ├── package.json
├── terraform # configurations terraform pour les ressources
│    ├── backend.tf # configuration du stockage de l'état
│    ├── main.tf # configuration générale
│    ├── variables.tf
│    |── modules
│    │   ├── bigquery # module pour la création d'un dataset et d'une table bigquery
│    │   │   ├── bigquery.tf
│    │   │   ├── variables.tf
│    │   ├── functions # module pour la création d'une fonction
│    │   │   ├── basic_function.tf
│    │   │   ├── variables.tf
│    │   ├── storage # module pour la création d'un bucket storage pour la sauvegarde de l'état
│    │   │   ├── storage.tf
│    │   │   ├── variables.tf

```




