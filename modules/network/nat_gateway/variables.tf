variable "vpc_id" {
    description = "VPC ID of which to create the subnet inside"
    type = string
}

variable "public_subnet_id" {
  description = "Resource ID of the Subnet to associate the NatGW with"
  type = string
}

variable "eip_id" {
  description = "Resource ID of the Elastic IP to be associated with the NAT Gateway"
  type = string
}

variable "resourceTags" {
    description = "Tags to be added to resource being created"
    type = map
}