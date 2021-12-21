data "google_compute_subnetwork" "subnet4" {
  name    = "sbn-hr-1"
  project = "vpc-share-network"
  region  = "asia-northeast3"
  
}

