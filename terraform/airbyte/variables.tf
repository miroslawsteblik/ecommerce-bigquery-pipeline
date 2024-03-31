variable "gcp_project_id" {
  type = string
  description = "The GCP Project ID where Airbyte will load data"
}

variable "airbyte_workspace_id" {
  type = string
  description = "The UUID of your airbyte workspace."
}


variable "destination_name" {
  type = string
  description = "A human readable name for your destination, often just the name of the destination type"
}


variable "gcp_hmac_access_key" {
    type = string
}

variable "gcp_hmac_secret" {
    type = string
}

variable "dataset_id" {
    type = string
    default = "raw_data"
}

variable "dataset_location" {
    type = string
}

variable "credentials_json" {
    type = string
}

variable "gcs_bucket_name" {
    type = string
}

variable "gcs_bucket_path" {
    type = string
}