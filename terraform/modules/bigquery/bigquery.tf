resource "google_biquery_dataset" "bigquery_dataset_iim_julien_dupont_1" {
    dataset_id = var.bigquery_dataset_name
    location = var.region
    friendly_name = "Players"
    description = "List of players"
}

resource "google_bigquery_table" "biquery_table_iim_juliendupont_1" {
    dataset_id = var.bigquery_dataset_name
    table_id = var.bigquery_table_name
    
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