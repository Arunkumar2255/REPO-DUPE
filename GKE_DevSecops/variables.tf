variable "project" {
  type        = string
  description = "Google Cloud Project Name"
}

variable "region" {
  type        = string
  description = "Default Google Cloud Region"
}

variable "vpc" {
  type        = string
  description = "Development Environment VPC Network"
}

variable "gke_subnet_name" {
  type        = string
  description = "GKE Subnet Name"
}

variable "gke_subnet_region" {
  type        = string
  description = "GKE Subnet Region"
}

variable "gke_subnet_cidr" {
  type        = string
  description = "GKE Subnet CIDR"
}

variable "gke_subnet_cluster_cidr" {
  type        = string
  description = "GKE Subnet Cluster CIDR"
}

variable "gke_subnet_services_cidr" {
  type        = string
  description = "GKE Subnet Services CIDR"
}

variable "cluster_name" {
  type        = string
  description = "GKE cluster name"
}

variable "cluster_location" {
  type        = string
  description = "GKE cluster Region/Zone"
}

variable "standard_machine_type" {
  type        = string
  description = "Machine type to use for the general-purpose node pool. See https://cloud.google.com/compute/docs/machine-types"
}

variable "standard_min_node_count" {
  type        = string
  description = "The minimum number of nodes PER ZONE in the general-purpose node pool"
  default     = 1
}

variable "standard_max_node_count" {
  type        = string
  description = "The maximum number of nodes PER ZONE in the general-purpose node pool"
  default     = 5
}

variable "node_disk_size_gb" {
  description = "The disk size in GB for the worker nodes"
  type        = number
}

variable "node_count" {
  description = "The number of nodes in the pool"
  type        = number
  default     = 1
}
variable "node_disk_type" {
  description = "The disk type for the worker nodes (e.g., pd-standard)"
  type        = string
}

# variable "secondary_ip_range" {
#   type = list(string)
# }

variable "ports" {
  type = list(string)
}

variable "source_ranges" {
  type = list(string)
}

variable "source_ip_ranges_to_nat" {
  type = list(string)
}

variable "zone" {
  type = string
}

variable "jump-host" {
  type = string
}

variable "jump-machine" {
  type = string
}

variable "vm_image" {
  type = string
}


# variable "pritunlfile" {
#   type = string
# }

# variable "service_account_email" {
#   description = "The service account email to attach to the VM"
#   type        = string
# }
variable "repository_id" {
  type        = string
  description = "The repository name"
}

variable "location" {
  type        = string
  description = "The name of the location this repository is located in"
}

variable "format" {
  type        = string
  description = "The format of packages that are stored in the repository. You can only create alpha formats if you are a member of the alpha user group."
}

variable "description" {
  type        = string
  description = "The user-provided description of the repository"
  default     = null
}

# # Cluster variables
# variable "cluster_name" {
#   description = "The name of the Kubernetes cluster"
#   type        = string
# }

#  variable "private_subnet_name" {
#    description = "The name of the subnetwork"
#    type        = string
# }

# variable "cidr_block" {
#   description = "CIDR block for master authorized networks"
#   type        = string
# }

# variable "cidr_display_name" {
#   description = "Display name for the CIDR block"
#   type        = string
# }

# variable "master_ipv4_cidr_block" {
#   description = "CIDR block for the Kubernetes control plane"
#   type        = string
# }

# variable "services_secondary_range_name" {
#   description = "The secondary range name for services"
#   type        = string
# }

# variable "cluster_secondary_range_name" {
#   description = "The secondary range name for the cluster"
#   type        = string
# }

# variable "logging_service" {
#   description = "Logging service (e.g., logging.googleapis.com/kubernetes)"
#   type        = string
#   default     = "logging.googleapis.com/kubernetes"
# }

# variable "monitoring_service" {
#   description = "Monitoring service (e.g., monitoring.googleapis.com/kubernetes)"
#   type        = string
#   default     = "monitoring.googleapis.com/kubernetes"
# }

# # Node pool variables
# variable "nodepool_name" {
#   description = "The name of the node pool"
#   type        = string
# }

# variable "node_count" {
#   description = "The number of nodes in the pool"
#   type        = number
#   default     = 1
# }

# variable "preemptible" {
#   description = "Whether the nodes are preemptible"
#   type        = bool
#   default     = true
# }

# variable "node_machine_type" {
#   description = "The machine type for the worker nodes"
#   type        = string
# }

# variable "node_disk_type" {
#   description = "The disk type for the worker nodes (e.g., pd-standard)"
#   type        = string
# }

# variable "node_disk_size_gb" {
#   description = "The disk size in GB for the worker nodes"
#   type        = number
# }

# variable "node_image_type" {
#   description = "The image type for the worker nodes (e.g., COS, Ubuntu)"
#   type        = string
# }

# variable "node_service_account_name" {
#   description = "The service account name for the GKE node pool"
#   type        = string
# }

# variable "node_sa_roles" {
#   description = "A list of IAM roles to assign to the node service account"
#   type        = list(string)
# }
#  variable "cluster_secondary_cidr" {
#    description = "Secondary CIDR range for GKE Pods"
#    type        = string
#  }

#  variable "services_secondary_cidr" {
#    description = "Secondary CIDR range for GKE Services"
#    type        = string
#  }

variable "min-master-version" {
  type        = string
  description = "GKE Cluster version"
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "GKE private CIDR"
}
variable "database" {
  description = "The name of the Cloud SQL database"
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

# Note, after a name db instance is used, it cannot be reused for up to one week.
variable "name_prefix" {
  description = "The name prefix for the database instance. Will be appended with a random string. Use lowercase letters, numbers, and hyphens. Start with a letter."
  type        = string
}

variable "master_user_name" {
  description = "The username part for the default user credentials, i.e. 'master_user_name'@'master_user_host' IDENTIFIED BY 'master_user_password'. This should typically be set as the environment variable TF_VAR_master_user_name so you don't check it into source control."
  type        = string
}

variable "master_user_password" {
  description = "The password part for the default user credentials, i.e. 'master_user_name'@'master_user_host' IDENTIFIED BY 'master_user_password'. This should typically be set as the environment variable TF_VAR_master_user_password so you don't check it into source control."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# Generally, these values won't need to be changed.
# ---------------------------------------------------------------------------------------------------------------------

variable "mysql_version" {
  description = "The engine version of the database, e.g. `MYSQL_5_6` or `MYSQL_5_7`. See https://cloud.google.com/sql/docs/features for supported versions."
  type        = string
  default     = "MYSQL_5_7"
}

variable "machine_type_sql" {
  description = "The machine type to use, see https://cloud.google.com/sql/pricing for more details"
  type        = string
  default     = "db-f1-micro"
}

variable "db_name" {
  description = "Name for the db"
  type        = string
  default     = "default"
}

variable "name_override" {
  description = "You may optionally override the name_prefix + random string by specifying an override"
  type        = string
  default     = null
}
