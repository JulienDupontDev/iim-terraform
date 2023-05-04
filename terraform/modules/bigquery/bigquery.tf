
# Création d'un dataset
resource "google_bigquery_dataset" "bigquery_dataset_iim_julien_dupont_1" {
    dataset_id = var.bigquery_dataset_name
    location = var.region
    friendly_name = "Players"
    description = "List of players"
}

# Création d'une table dans le dataset
resource "google_bigquery_table" "biquery_table_iim_juliendupont_1" {
    dataset_id = google_bigquery_dataset.bigquery_dataset_iim_julien_dupont_1.dataset_id
    table_id = var.bigquery_table_name
    deletion_protection = false
    # Définition du schéma de la table
    schema = <<EOF
    [
        {
            "name": "id",
            "type": "STRING",
            "mode": "REQUIRED"
        },
        {
            "name": "name",
            "type": "STRING",
            "mode": "REQUIRED"
        },
        {
            "name": "score",
            "type": "INTEGER",
            "mode": "REQUIRED"
        }
    ]
    EOF
}