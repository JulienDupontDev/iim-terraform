resource "google_storage_bucket" "bucket_iim_juliendupont_state_1" {
  name     = var.storage_bucket_name
  location = var.region
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  force_destroy = true
  uniform_bucket_level_access = true
}