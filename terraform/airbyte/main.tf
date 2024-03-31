// Airbyte Terraform provider documentation: https://registry.terraform.io/providers/airbytehq/airbyte/latest/docs

// Sources
resource "airbyte_source_faker" "faker" {
  configuration = {
    always_updated    = false
    count             = 1000
    parallelism       = 9
    records_per_slice = 10
    seed              = 6
    source_type       = "faker"
  }
  name         = "Faker"
  workspace_id = var.airbyte_workspace_id
}

// Destinations
resource "airbyte_destination_bigquery" "my_destination_bigquery" {
  configuration = {
    big_query_client_buffer_size_mb = 15
    credentials_json                = var.credentials_json
    dataset_id                      = var.dataset_id
    dataset_location                = var.dataset_location
    disable_type_dedupe             = false
    loading_method = {
      gcs_staging = {
        credential = {
          hmac_key = {
            hmac_key_access_id = var.gcp_hmac_access_key
            hmac_key_secret    = var.gcp_hmac_secret
          }
        }
        gcs_bucket_name          = "data-ops-bucket-faker"
        gcs_bucket_path          = "data-ops-bucket-faker/faker-ecommerce"
        keep_files_in_gcs_bucket = "Delete all tmp files from GCS"
      }
    }
    project_id              = var.gcp_project_id
    #raw_data_dataset        = ""
    transformation_priority = "batch"
  }
  #definition_id = ""
  name          = var.destination_name
  workspace_id  = var.airbyte_workspace_id
}




// Connections
resource "airbyte_connection" "faker_to_bigquery" {
    name = "Faker to BigQuery"
    source_id = airbyte_source_faker.faker.source_id
    destination_id = airbyte_destination_bigquery.my_destination_bigquery.destination_id
    configurations = {
        streams = [
            {
                name = "users"
            },
            {
                name = "products"
            },
            {
                name = "purchases"
            },
        ]
    }
}