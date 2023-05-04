
locals {
  timestamp = formatdate("YYMMDDhhmmss", timestamp())
	root_dir = abspath("../")
}

# Compression du code source
data "archive_file" "source" {
  type        = "zip"
  source_dir  = local.root_dir
  output_path = "/tmp/function-${local.timestamp}.zip"
}

# Création du bucket pour stocker le code source de la fonction
resource "google_storage_bucket" "bucket" {
  name = "${var.project}-function"
  location = "europe-west1"
}

# Ajouter le zip au bucket
resource "google_storage_bucket_object" "zip" {
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

# Création Cloud Functino
resource "google_cloudfunctions_function" "function" {
  name    = var.function_name
  runtime = "nodejs16" # Switch to a different runtime if needed

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.zip.name
  trigger_http          = true
  entry_point           = var.function_entry_point
}

# Create IAM entry so all users can invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}