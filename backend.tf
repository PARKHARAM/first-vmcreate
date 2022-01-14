terraform{
    required_providers{
        google = " ~> 3.5"
    }

    backend "gcs"{
        credentials = "/var/lib/jenkins/eloquent-marker-338005-1fa6b785f519.json"
        bucket      = "haram-test"
        prefix      = "jenkins.terraform.tfstate"
    }
}