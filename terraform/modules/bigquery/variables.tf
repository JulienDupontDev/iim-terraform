# Nom du dataset
variable "bigquery_dataset_name" {
  default = "dataset_iim_juliendupont_1"
}

# Nom de la table
variable "bigquery_table_name" {
  default = "table_iim_juliendupont_1"
}

# Région sur laquelle le dataset et la table seront créés
variable "region" {
  default = "EU"
}

# Projet sur lequel le dataset et la table seront créés
variable "project" {
  default = "iim-gcp"
}