provider "aws" {
  region = "us-east-2"
}

module "mysql" {
  source         = "git@github.com:freelandr/tf-modules.git//data-storage/mysql?ref=main"
  cluster_name   = "stage"
  instance_class = "db.t2.micro"
}

# need to provide db username and password values via environment variables
