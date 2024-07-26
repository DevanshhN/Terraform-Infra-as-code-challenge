variable "vpc_id" {
    description = "VPC ID of which to create the subnet inside"
    type = string
}

variable "name" {
  description = "The name of the SG"
  type = string
  default = "Challenge SG"
}

variable "description" {
  description = "The description of the security group"
  default = "Challenge SG"
  type = string
}

variable "resourceTags" {
  description = "The tags to be added to the resource"
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
    security_groups = list(string)
    description = string
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = list(string)
    description     = string
  }))
}