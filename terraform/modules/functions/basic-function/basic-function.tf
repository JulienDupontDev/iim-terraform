
locals {
  timestamp = formatdate("YYMMDDhhmmss", timestamp())
  // function is located in terraform/modules/functions/basic-function/
	root_dir = abspath("./functions/basic-function/")
}

# Compression du code source
data "archive_file" "source_iim_juliendupont_1" {
  type        = "zip"
  source_dir  = local.root_dir
  output_path = "/tmp/function-${local.timestamp}.zip"
}

# Création du bucket pour stocker le code source de la fonction
resource "google_storage_bucket" "bucket_function_iim_juliendupont_1" {
  name = "${var.project}-function"
  location = "${var.region}"
}

# Ajouter le zip au bucket
resource "google_storage_bucket_object" "zip_iim_juliendupont_1" {
  # On ajoute le MD5 du fichier pour forcer la regénération
  name   = "source.zip#${data.archive_file.source.output_md5}"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.source.output_path
}

# Activation API Cloud functions
resource "google_project_service" "cf" {
  project = var.project
  service = "cloudfunctions.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

# Activation API Cloud Build 
resource "google_project_service" "cb" {
  project = var.project
  service = "cloudbuild.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

# Création Cloud Functions
resource "google_cloudfunctions_function" "function_iim_juliendupont_1" {
  name    = var.function_name
  runtime = "nodejs18"
  region = var.region


  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.zip.name
  trigger_http          = true
  entry_point           = var.function_entry_point
}

# À des fins de démonstration uniquement, activation de l'invocation de la fonction par tous les utilisateurs
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}