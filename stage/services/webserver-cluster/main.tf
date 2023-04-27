provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "git@github.com:freelandr/tf-modules.git//services/webserver-cluster?ref=main"

  cluster_name                = "webservers-stage"
  db_remote_state_bucket      = "terraform-state-bucket-11112"
  db_remote_state_key         = "stage/data-storage/mysql/terraform.tfstate"
  instance_type               = "t2.micro"
  server_ami                  = "ami-0fb653ca2d3203ac1"
  server_text                 = "I'm a staging webserver"
  enable_autoscaling_schedule = false
  min_size                    = 1
  max_size                    = 1
}

# define additional resources on top of those provided by the module
resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id      # refer to a resource created by the module

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}