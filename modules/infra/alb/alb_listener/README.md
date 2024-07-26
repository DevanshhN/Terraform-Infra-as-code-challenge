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
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lb_arn"></a> [lb\_arn](#input\_lb\_arn) | ARN of the load balancer | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port on which the load balancer is listening | `number` | `443` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol for connections from clients to the load balancer. | `string` | `"HTTP"` | no |
| <a name="input_resourceTags"></a> [resourceTags](#input\_resourceTags) | The tags to be added to the resource | `map` | n/a | yes |
| <a name="input_tg_arn"></a> [tg\_arn](#input\_tg\_arn) | ARN of the Target Group to which to route traffic | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->