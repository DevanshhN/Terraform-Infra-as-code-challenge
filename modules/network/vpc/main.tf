resource "aws_vpc" "challengeVPC" {
	cidr_block           = var.cidr_block
	enable_dns_hostnames = true
	enable_dns_support   = true
	instance_tenancy     = "default"

	tags = var.resourceTags
}