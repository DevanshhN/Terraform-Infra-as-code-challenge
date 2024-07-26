resource "aws_lb_target_group_attachment" "this" {
  
  target_group_arn = var.tg_arn
  target_id = var.ec2_id
  port = 80
}