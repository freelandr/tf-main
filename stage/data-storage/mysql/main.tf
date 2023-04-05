provider "aws" {
  region = "us-east-2"
}

module "mysql" {
  source         = "git@github.com:freelandr/tf-modules.git//data-storage/mysql?ref=v0.0.1"
  cluster_name   = "db-stage"
  instance_class = "db.t2.micro"
}

# need to provide db username and password values via environment variables
