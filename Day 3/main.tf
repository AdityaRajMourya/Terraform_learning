


module "resource_groups" {
  source = "/Users/jatinbhalla/Terraform_learning/Day 1/az_resourcegroup"

  resource_groups = var.resource_groups
}

module "storage_account" {
  source                  = "/Users/jatinbhalla/Terraform_learning/Day 1/azstorageaccount"
  storage_account_name    = "examplestorageacct"
  resource_group_name     = module.resource_groups.resource_group_names["rg1"]
  resource_group_location = module.resource_groups.resource_group_locations["rg1"]
}
