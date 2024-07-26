variable "vpc_id" {
    description = "VPC ID of which to create the subnet inside"
    type = string
}

variable "resourceTags" {
  description = "The tags to be added to the resource"
    type = map
}

variable "port" {
  description = "The port value associated with the TG"
  type = number
  default = 443
}