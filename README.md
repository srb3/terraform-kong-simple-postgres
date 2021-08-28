# terraform-kong-simple-postgres

A terraform module for installing a Postgres database, primarily for
use with Kong. This aim of this module is not to create highly available
Postgres deployment, but rather to have a simple mechanism for providing
a database for Kong to connect to in testing or POC situations.
Under the hood this module calls the [geerlingguy](https://github.com/srb3/ansible-role-kong-gateway)
Ansible role for Postgres.

## Usage

### Using module defaults

The following will install Postgres
onto a previously created vm

```HCL
locals {
  databases = [
    {
      "name"  = "kong"
      "owner" = "kong"
    }
  ]
  users = [
    {
      "name"     = "kong"
      "password" = "kong"
    }
  ]
}

module "postgresql-install" {
  source               = "../../"
  hosts                = [module.ec2_instance.public_ip]
  ssh_user_name        = "ex2-user"
  ssh_user_private_key = "~/.ssh/id_rsa"
  databases            = local.databases
  users                = local.users
}

```

## Testing

No testing yet
