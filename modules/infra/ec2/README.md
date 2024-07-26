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
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI id using which the resource will be created, this AMI is only for US-east-1 | `string` | `"ami-04a81a99f5ec58529"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance size of the resource | `string` | `"t2.small"` | no |
| <a name="input_resourceTags"></a> [resourceTags](#input\_resourceTags) | The tags to be added to the resource | `map` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | The SG to the attached to the EC2 Instance | `list(string)` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Key name of the Key Pair to use for the instance | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet in which the instance will be launched, this value is required from the parent module | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | n/a |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | n/a |
<!-- END_TF_DOCS -->