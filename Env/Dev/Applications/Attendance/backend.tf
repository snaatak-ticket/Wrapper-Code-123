terraform {
  backend "s3" {
    bucket         = "otms-sprint5-bucket"
    key            = "env/dev/Applications/Attendance/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dev-otms-tf-lock-table"
  }
}
