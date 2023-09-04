###################################################
###              Intersight Orgs                ###
###################################################

module "intersightorganizationMoid" {

  source = "./modules/intersight/organization"

  organization = var.organization

}
