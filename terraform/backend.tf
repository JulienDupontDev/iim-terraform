terraform {
  backend "gcs" {
    bucket = "bucket_iim_juliendupont_state_1"
    prefix = "terraform/state"
  }
}