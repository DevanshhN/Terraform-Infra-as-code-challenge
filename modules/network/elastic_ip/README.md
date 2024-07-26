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
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resourceTags"></a> [resourceTags](#input\_resourceTags) | Tags to be added to resource being created | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elastic_ip_id"></a> [elastic\_ip\_id](#output\_elastic\_ip\_id) | Resource ID of the Elastic IP |
<!-- END_TF_DOCS -->