output "alb_dns_name" {
  value       = module.webserver_cluster.alb_dns_name               # pass through the output from the module
  description = "The domain name of the load balancer"
}