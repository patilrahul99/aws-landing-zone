module "organization" {
  source = "./modules/organization"
}

module "ous" {
  source  = "./modules/ous"
  root_id = module.organization.root_id
}

module "accounts" {
  source   = "./modules/accounts"
  accounts = var.accounts
}

module "scp" {
  source = "./modules/scp"

  root_id       = module.organization.root_id
  nonprod_ou_id = module.ous.nonprod_ou_id
  prod_ou_id    = module.ous.prod_ou_id
}

module "logging" {
  source = "./modules/logging"
}
