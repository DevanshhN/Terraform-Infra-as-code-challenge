output "igw_id" {
  value = aws_internet_gateway.us-west-2-igw.id
  description = "Resource ID of the Internet Gateway created"
}