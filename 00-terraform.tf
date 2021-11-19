provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
  backend "s3" {
    bucket         = "web-fitec-terraform-01"
    key            = "WEB/FITEC/web.tfstate"
    dynamodb_table = "web-fitec"
  }
}
