# Nom de la fonction
variable "function_name" {
    default = "function_iim_juliendupont_1"
}

# Nom du point d'entrée de la fonction
variable "function_entry_point" {
    default = "app"
}

# région sur laquelle la fonction sera déployée
variable "region" {
	default = "europe-west1"
}

# projet sur lequel la fonction sera déployée
variable "project" {
	default = "iim-gcp"
}