variable "resource_groups" {
  type = map(object({
    location = string
  }))
  default = {
    rg1 = { location = "eastus" }
    rg2 = { location = "westus" }
  }
}
