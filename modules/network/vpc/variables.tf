variable "cidr_block" {
  type = string
  description = "CIDR range of the VPC to be created, it will be passed from the root main.tf file"
}

variable "resourceTags" {
    description = "Tags to be added to resource being created"
    type = map
}