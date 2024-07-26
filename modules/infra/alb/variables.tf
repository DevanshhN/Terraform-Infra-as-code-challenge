variable "subnet_ids" {
  type = list(string)
  description = "List of subnet id in which the resource will be launched"
}

variable "security_groups" {
  type = string
  description = "The SG to attach to ALB"
}

variable "resourceTags" {
  description = "The tags to be added to the resource"
}