output "endpoint_address" {
  value       = module.mysql.endpoint_address                       # pass through the output from the module
  description = "connect to the database at this endpoint"      
}

output "port" {
  value       = module.mysql.port                       # pass through the output from the module
  description = "connect to the database on this"      
}