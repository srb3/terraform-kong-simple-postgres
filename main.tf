locals {

  conf = templatefile("${path.module}/templates/vars", {
    kong_database_name       = var.kong_database_name
    kong_database_password   = var.kong_database_password
    kong_database_user       = var.kong_database_user
    postgres_master_password = var.postgres_master_password
  })

  roles = [
    "geerlingguy.postgresql"
  ]

  hosts = {
    "postgresql" = {
      role            = "geerlingguy.postgresql"
      hosts           = var.hosts
      vars            = local.conf
      ssh_user        = var.ssh_user_name
      ssh_private_key = var.ssh_user_private_key
    }
  }
}

module "role" {
  source  = "srb3/role/ansible"
  version = "0.0.4"
  roles   = local.roles
  hosts   = local.hosts
}
