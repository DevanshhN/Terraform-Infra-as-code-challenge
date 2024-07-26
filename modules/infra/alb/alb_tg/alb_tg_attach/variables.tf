variable "tg_arn" {
  description = "The ARN of the target group with which to register targets."
  type = string
}

variable "ec2_id" {
  description = "This is the Instance ID for an instance"
  type = string
}