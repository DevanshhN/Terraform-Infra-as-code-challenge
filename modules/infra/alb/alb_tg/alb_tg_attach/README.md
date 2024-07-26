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
| [aws_lb_target_group_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_id"></a> [ec2\_id](#input\_ec2\_id) | This is the Instance ID for an instance | `string` | n/a | yes |
| <a name="input_tg_arn"></a> [tg\_arn](#input\_tg\_arn) | The ARN of the target group with which to register targets. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->