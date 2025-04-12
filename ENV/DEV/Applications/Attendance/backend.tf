terraform {
  backend "s3" {
    bucket = "otms-sprint5-bucket"
    key    = "env/qa/network skeleton/terraform.tfstate"
    region = "us-east-2"
  }
}
