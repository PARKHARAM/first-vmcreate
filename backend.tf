terraform{
    required_providers{
        google = " ~> 3.5"
    }

    backend "gcs"{
        credentials = "/var/lib/jenkins/pjt-an3-dev-vm-8b31a81db7eb.json"
        bucket      = "haram-test-bucket"
        prefix      = "jenkins.terraform.tfstate"
    }
}