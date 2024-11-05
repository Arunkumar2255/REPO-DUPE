variable "database" {
  description = "The name of the Cloud SQL database"
  type        = string
}

variable "region" {
  description = "The region where the Cloud SQL instance will be created"
  type        = string
}

variable "tier" {
  description = "The machine type/tier for the Cloud SQL instance (e.g., db-n1-standard-1)"
  type        = string
}

variable "disk_size" {
  description = "The size of the disk (in GB) for the Cloud SQL instance"
  type        = number
}

variable "db_user_name" {
  description = "The custom username for the database user"
  type        = string
}

variable "db_password" {
  description = "The password for the database user (stored securely in Secret Manager)"
  type        = string
  sensitive   = true
}
variable "private_network" {
  description = "The private network self-link for the Cloud SQL instance"
  type        = string
}
