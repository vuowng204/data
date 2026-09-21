terraform {
  required_providers {
    google ={
      source = "hashicorp/google"
      version = "8.3.0"
    }
  }
}
  
provider "google" {
    credentials=file("~/pipeline/terraform-demo/my_keys.json")
    project = "terraform-demo"
    region  = "asia-northeast1"
  }



resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = "example_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = var.location
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "roles/bigquery.dataOwner"
    user_by_email = google_service_account.bqowner.email
  }

  access {
    role   = "READER"
    domain = "hashicorp.com"
  }
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}



