variable "lb_arn" {
  type = string
  description = "ARN of the load balancer"
}

variable "port" {
  type = number
  description = "Port on which the load balancer is listening"
  default = 443
}

variable "protocol" {
  type = string
  description = "Protocol for connections from clients to the load balancer."
  default = "HTTP"
}

variable "tg_arn" {
  description = "ARN of the Target Group to which to route traffic"
  type = string
}

variable "resourceTags" {
  description = "The tags to be added to the resource"
  type = map
}