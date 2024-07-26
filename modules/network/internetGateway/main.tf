resource "aws_internet_gateway" "us-west-2-igw" {
	vpc_id = var.vpc_id
	tags = var.resourceTags
}