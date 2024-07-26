output "elastic_ip_id" {
  value = aws_eip.eip.id
  description = "Resource ID of the Elastic IP"
}