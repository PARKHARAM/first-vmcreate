
provider "google" {
  version = "3.5.0"
  credentials = "/var/lib/jenkins/eloquent-marker-338005-1fa6b785f519.json"
  project = "eloquent-marker-338005"
  region  = "asia-northeast3"
  zone    = "asia-northeast3-a"
}

resource "google_compute_instance" "default" {
  name         = var.VM_NAME
  machine_type = var.VM_MACHINE_TYPE
  zone         = var.VM_ZONE
  allow_stopping_for_update = true


  metadata_startup_script = data.template_cloudinit_config.cloudinit-jenkins.rendered



  tags = ["sgtag-jenkins-ssh", "sgtag-jenkins-web","sgtag-jenkins-instance", "sgtag-test", "sgtag-80"]
  
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      type = "pd-standard"
      size = 20
    }
  }
  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet4.self_link
    access_config {
    }
  }

  labels = {
    cpu = "1"
  }

 
 
  metadata = {
    foo = "bar"    
    serial-port-enable = false
    block-project-ssh-keys = false

  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    scopes = ["storage-rw"]
  }


}

resource "google_compute_instance" "default22"{
  name         = "default22"
  machine_type = var.VM_MACHINE_TYPE
  zone         = var.VM_ZONE
  allow_stopping_for_update = true


  metadata_startup_script = data.template_cloudinit_config.cloudinit-jenkins.rendered



  tags = ["sgtag-jenkins-ssh", "sgtag-jenkins-web","sgtag-jenkins-instance", "sgtag-test", "sgtag-80" ]
  
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      type = "pd-standard"
      size = 20
    }
  }
  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet4.self_link
    access_config {
    }
  }

  labels = {
    cpu = "1"
  }

 
 
  metadata = {
    foo = "bar"    
    serial-port-enable = false
    block-project-ssh-keys = false

  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    scopes = ["storage-rw"]
  }


}
resource "google_compute_instance" "default252"{
  name         = "default151"
  machine_type = var.VM_MACHINE_TYPE
  zone         = var.VM_ZONE
  allow_stopping_for_update = true


  metadata_startup_script = data.template_cloudinit_config.cloudinit-jenkins.rendered



  tags = ["sgtag-jenkins-ssh", "sgtag-jenkins-web","sgtag-jenkins-instance", "sgtag-test" ,"sgtag-80"]
  
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      type = "pd-standard"
      size = 20
    }
  }
  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet4.self_link
    access_config {
    }
  }

  labels = {
    cpu = "1"
  }

 
 
  metadata = {
    foo = "bar"    
    serial-port-enable = false
    block-project-ssh-keys = false

  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    scopes = ["storage-rw"]
  }


}





