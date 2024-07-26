resource "aws_route_table" "this" {
    vpc_id = var.vpc_id
    route {
        cidr_block = var.cidr_block
        gateway_id = var.gateway_id
        nat_gateway_id = var.nat_gateway_id
    }
    tags = var.resourceTags
}