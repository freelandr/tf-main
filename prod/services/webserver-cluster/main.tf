provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "git@github.com:freelandr/tf-modules.git//services/webserver-cluster?ref=main"

  cluster_name                = "webservers-prod"
  db_remote_state_bucket      = "terraform-state-bucket-11112"
  db_remote_state_key         = "prod/data-storage/mysql/terraform.tfstate"
  instance_type               = "t2.micro"
  server_ami                  = "ami-0fb653ca2d3203ac1"
  enable_autoscaling_schedule = true
  min_size                    = 1
  max_size                    = 1

  custom_tags = {
    Owner     = "team-foo"
    ManagedBy = "terraform"
  }
}