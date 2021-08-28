provider "libvirt" {
  uri = "qemu:///system"
}

module "pg" {
  source                     = "srb3/domain/libvirt"
  version                    = "0.0.1"
  hostname                   = "pg-1"
  user                       = "kong"
  ssh_public_key             = "~/.ssh/id_rsa.pub"
  os_name                    = "centos"
  os_version                 = "8"
  os_cached_image            = var.os_cached_image
  unique_libvirt_domain_name = false
}

output "kong_cp" {
  value = module.pg
}

module "postgresql-install" {
  source               = "../../"
  hosts                = [module.pg.ip]
  ssh_user_name        = "kong"
  ssh_user_private_key = "~/.ssh/id_rsa"
}
