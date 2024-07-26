<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR of the route | `string` | n/a | yes |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Resource ID of the Internet Gateway | `string` | `null` | no |
| <a name="input_nat_gateway_id"></a> [nat\_gateway\_id](#input\_nat\_gateway\_id) | Resource ID of the Nat Gateway | `string` | `null` | no |
| <a name="input_resourceTags"></a> [resourceTags](#input\_resourceTags) | Tags to be added to resource being created | `map` | <pre>{<br>  "name": "Challenge RT"<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID of which to create the subnet inside | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rt_id"></a> [rt\_id](#output\_rt\_id) | n/a |
<!-- END_TF_DOCS -->