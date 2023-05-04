provider "google" {
  project = var.project
  region  = var.region
}

 module "function_iim_dev" {
   source               = "./modules/function"
   project              = var.project
   function_name        = "function_iim_dev"
   function_entry_point = "app"
 }