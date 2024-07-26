variable "vpc_id" {
    description = "VPC ID of which to create the subnet inside"
    type = string
}

variable "resourceTags" {
  description = "Tags to be added to the resource"
  type = map
}