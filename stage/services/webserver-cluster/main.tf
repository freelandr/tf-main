provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "git@github.com:freelandr/tf-modules.git//services/webserver-cluster?ref=v0.0.1"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-state-bucket-11112"
  db_remote_state_key    = "stage/services/webserver-cluster/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 1
  max_size               = 1
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}