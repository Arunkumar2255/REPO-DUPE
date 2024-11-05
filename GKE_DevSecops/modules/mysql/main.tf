# Cloud SQL Instance Resource
resource "google_sql_database_instance" "instance" {
  name             = "estore-${var.region}"
  region           = var.region
  database_version = "MYSQL_8_0"

  settings {
    tier              = var.tier
    availability_type = "REGIONAL"
    disk_size         = var.disk_size

    # Backup configuration
    backup_configuration {
      enabled            = true
      binary_log_enabled = true
    }

    # IP configuration (Private IP only)
    ip_configuration {
      ipv4_enabled      = false   # Disable public IP access
      private_network = var.private_network # Use private IP in VPC   # Enforce SSL for security
      enable_private_path_for_google_cloud_services = true
    }

    # Enable detailed logging and monitoring
    database_flags {
      name  = "log_output"
      value = "FILE"
    }

    database_flags {
      name  = "general_log"
      value = "on"
    }
  }

  deletion_protection = true  # Enable deletion protection in production
}

# Cloud SQL Database Resource
resource "google_sql_database" "database" {
   name     = var.database
   instance = google_sql_database_instance.instance.name
   charset  = "utf8"
   collation = "utf8_general_ci"
}

# Cloud SQL User Resource
resource "google_sql_user" "custom_user" {
  name     = var.db_user_name
  instance = google_sql_database_instance.instance.name
  host     = "%"
  password = google_secret_manager_secret_version.db_password_secret.secret_data # Use password from Secret Manager
}

# Google Secret Manager for storing database password
resource "google_secret_manager_secret" "db_password" {
  secret_id = "db-password"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password_secret" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = var.db_password  # Add password securely
}
