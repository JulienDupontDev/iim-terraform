terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "4.63.1"
  project = var.project
  region  = var.region
}

module "functions" {
  source = "./modules/functions"
}

module "storage" {
  source  = "./modules/storage"
}