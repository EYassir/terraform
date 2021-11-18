provider "aws" {
  region  = var.region
  profile = var.profile
}


terraform {
  backend "s3" {
    bucket         = "fitec-remote-backend"
    region         = "eu-west-1"
    key            = "FITEC/backend/terraform.tfstate"
    dynamodb_table = "fitec-terraform"
  }
}