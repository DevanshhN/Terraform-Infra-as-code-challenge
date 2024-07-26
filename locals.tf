locals {
  public_subnet_ids = {
    "subnet_1a" = module.public_subnet_1a.subnet_id,
    "subnet_1b" = module.public_subnet_1b.subnet_id
  }

  public_subnet_ids_list = values(local.public_subnet_ids)

}

