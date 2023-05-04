terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

# Configuration du provider Google
provider "google" {
  version = "4.63.1"
  project = var.project
  region  = var.region
  zone    = var.zone
}

# Appel des différents modules
module "storage" {
  source  = "./modules/storage"
}

module "functions" {
  source = "./modules/functions"
}

module "bigquery" {
  source = "./modules/bigquery"
}