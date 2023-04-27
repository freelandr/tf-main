variable "db_username" {
  description = "username for database"
  type = string
  sensitive = true                                  
}

variable "db_password" {
  description = "password for database"
  type = string
  sensitive = true
}