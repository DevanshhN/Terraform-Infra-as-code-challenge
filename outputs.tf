output "EC2_IP" {
  value = module.webservers[*].ec2_public_ip
}

output "ALB_dns" {
  value = module.public_alb.alb_public_dns
}