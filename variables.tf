variable "hosts" {
  type    = list(string)
  default = []
}

variable "ssh_user_name" {
  description = "The ssh user name of the kong instance"
  type        = string
}

variable "ssh_user_private_key" {
  description = "The ssh user private key of the kong instance"
  type        = string
}

variable "kong_database_name" {
  description = "The name to give the kong database in postgres"
  type        = string
  default     = "kong"
}

variable "kong_database_password" {
  description = "The password to give the kong database"
  type        = string
  default     = "kong"
}

variable "kong_database_user" {
  description = "The name of the user to give the kong database"
  type        = string
  default     = "kong"
}

variable "postgres_master_password" {
  description = "The password to give the postgres user"
  type        = string
  default     = "postgres"
}
