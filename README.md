# Terraform GCP - IIM Julien Dupont

## Prérequis

- Avoir un compte Google Cloud Platform
- Avoir un projet Google Cloud Platform (https://console.cloud.google.com/projectcreate)
- Avoir créé un compte de facturation (https://console.cloud.google.com/billing)
- Avoir rélié le projet à la facturation (https://cloud.google.com/billing/docs/how-to/modify-project)


## Structure du projet

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

- Modifier la variable "project" dans tous les fichiers variables.tf avec l'id correspondant à votre projet Google Cloud.

- Se déplacer dans le dossier terraform
```bash
cd terraform
```

- Commenter les lignes 3 à 6 du fichier backend.tf

- Initialiser Terraform (entrer "yes" quand demandé)
```bash
terraform init
```

- Vérifier que tout est ok
```bash
terraform plan
```
- Lancer le déploiement
```bash
terraform apply
```

- Décommenter les lignes 3 à 6 du fichier backend.tf puis lancer la commande
```bash
terraform init
```

## Supprimer les ressources

- Commenter les lignes 3 à 6 du fichier backend.tf
- Lancer la commande
```bash
terraform -migrate-state # permet de migrer l'état du bucket localement
```

- Supprimer les ressources
```bash
terraform destroy
```


## Accéder à la fonction 

- Aller dans la console Google Cloud Platform (https://console.cloud.google.com/functions/list)

- Cliquer sur la fonction

- Cliquer sur "Déclencheur"

- Copier le lien et l'ouvrir dans un autre fenêtre en ajoutant "/status" à la fin de l'url


