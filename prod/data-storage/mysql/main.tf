provider "aws" {
  region = "us-east-2"
}

module "mysql" {
  source = "../../../modules/data-storage/mysql"
  cluster_name = "db-stage"
  instance_class = "db.t2.micro"  
}

# need to provide db username and password values via environment variables
