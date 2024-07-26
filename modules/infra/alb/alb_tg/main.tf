resource "aws_lb_target_group" "this" {
  name = "challenge-lb-tg"
  port = var.port
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"
  deregistration_delay = "120"
  slow_start = "0"
  tags = var.resourceTags
	health_check {
		enabled             = true
		protocol            = "HTTP"
		path                = "/ping"
		healthy_threshold   = 5
		unhealthy_threshold = 2
		timeout             = 7
		interval            = 10
		matcher             = "200"
	}
}