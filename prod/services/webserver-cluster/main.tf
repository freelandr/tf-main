provider "aws" {
  region = "us-east-2"
}

# webserver
module "webserver_cluster" {
  source = "git@github.com:freelandr/tf-modules.git//services/webserver-cluster?ref=main"

  cluster_name                = "webservers-prod"
  db_remote_state_bucket      = "terraform-state-bucket-11112"
  db_remote_state_key         = "prod/data-storage/mysql/terraform.tfstate"
  instance_type               = "t2.micro"
  server_ami                  = "ami-0fb653ca2d3203ac1"
  server_text                 = "I'm a production webserver"  
  enable_autoscaling_schedule = true
  min_size                    = 1
  max_size                    = 1

resource "aws_autoscaling_schedule" "scale_out_business_hours" {
  scheduled_action_name = "scale-out-business-hours"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 10
  recurrence            = "0 9 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_night" {
  scheduled_action_name = "scale-in-night"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 2
  recurrence            = "0 17 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}
  
custom_tags = {
    Owner     = "team-foo"
    ManagedBy = "terraform"
  }
}
