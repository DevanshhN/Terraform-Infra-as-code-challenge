resource "aws_route_table_association" "this" {
  for_each = var.subnet_id
  subnet_id = each.value
  route_table_id = var.route_table_id
}