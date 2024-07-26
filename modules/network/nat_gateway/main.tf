resource "aws_nat_gateway" "ngw" {
  allocation_id = var.eip_id
  subnet_id     = var.public_subnet_id
  tags          = var.resourceTags
}
