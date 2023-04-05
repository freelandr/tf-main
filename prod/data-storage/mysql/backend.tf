terraform {
  backend "s3" {
    key = "prod/data-storage/mysql/terraform.tfstate"
  }
}