variable "ami" {
  description = "The AMI id using which the resource will be created, this AMI is only for US-east-1"
  type = string
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
    description = "The instance size of the resource"
    type = string
    default = "t2.small"
}

variable "subnet_id" {
  description = "The subnet in which the instance will be launched, this value is required from the parent module"
  type = string
}

variable "security_groups" {
  type = list(string)
  description = "The SG to the attached to the EC2 Instance"
}

variable "ssh_key" {
  description = "Key name of the Key Pair to use for the instance"
  type = string
}

variable "resourceTags" {
  description = "The tags to be added to the resource"
  type = map
}