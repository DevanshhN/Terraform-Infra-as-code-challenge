variable "vpc_id" {
    description = "VPC ID of which to create the subnet inside"
    type = string
}

variable "cidr_block" {
    description = "CIDR of the subnet to create the subnet"
    type = string
}

variable "availability_zone" {
  description = "The availability zone in which the subnet has to be created"
}

variable "map_public_ip" {
    description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
    default = false
    type = bool
}

variable "resourceTags" {
    description = "Tags to be added to resource being created"
    type = map
}