resource "aws_lb" "this" {
  internal = false
  load_balancer_type = "application"
  security_groups = [var.security_groups]
  subnets = var.subnet_ids
  tags = var.resourceTags
}