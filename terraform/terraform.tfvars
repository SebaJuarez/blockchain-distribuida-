# GCP
project_id       = "gentle-oxygen-457917-c0"
credentials_file = "terraform-sa-key.json"

# Bucket para fragmentos de imagen
# bucket_name      = "bucket-imagenes-sobel"

# Backend
bucket_backend   = "bucket-backend-sobel"
backend_prefix   = "terraform/tfstate"

# VPC / Subnet donde corre el cluster y las VMs
network    = "vpc-blockchain-network"
subnetwork = "subnetwork-blockchain"

infra_node_tag = "gke-infra-pool"


worker_min_nodes = 0
worker_max_nodes = 5
