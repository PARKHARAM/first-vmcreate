data "google_compute_subnetwork" "subnet4" {
  name    = "test-subnetwork"
  project = "pjt-vpc-network"
  region  = "asia-northeast3"
  
}

