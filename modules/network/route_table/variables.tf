variable "vpc_id" {
    description = "VPC ID of which to create the subnet inside"
    type = string
}

variable "cidr_block" {
    description = "CIDR of the route"
    type = string
}

variable "resourceTags" {
    description = "Tags to be added to resource being created"
    type = map
    default = { name = "Challenge RT"}
}

variable "gateway_id" {
  description = "Resource ID of the Internet Gateway"
  type = string
  default = null
}

variable "nat_gateway_id" {
  description = "Resource ID of the Nat Gateway"
  type = string
  default = null
}