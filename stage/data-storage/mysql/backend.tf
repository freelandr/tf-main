terraform {
  backend "s3" {
    key = "stage/data-storage/mysql/terraform.tfstate"
  }
}