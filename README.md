# Infra-as-Code-Challenge
DocNetwork's DevOps Challenge

## Challenge Details
The DevOps team at DocNetwork serve as the infrastructure engineers for the company. Strong competency with both AWS (or other cloud environments) and creating CI/CD pipelines are required for this position.

We don't want this challenge doesn't take too much of your personal time. We're all about MVP (**Minimum** Viable Product)! Give us the rubber bands and duct tape version of this project. We want to see how you approach the problem, not that you write the most perfect code in all the land.

What we are looking for is **Terraform code written to deploy an Auto Scaling Group (ASG) of web servers that deliver a website on AWS from a load balancer**. This should include the following:
1. VPC Configuration with subnets in multiple Availability Zones
2. EC2 Configuration
3. ELB to manage traffic
4. A running copy of the world's finest [Inspirational Quote Generator](https://github.com/docnetwork/InspirationalQuoteGenerator)

We love answering questions. Please send us your questions at the email address we sent you the challenge from. We're happy to help!

Also we understand this is an *infrastructure* challenge, and we've tried to make the application easy to manage. It's containerized, so starting the app should be as simple as running the container. We're more than happy to help with roadblocks here. Additionally, if you need to modify the application itself in any way, feel free to fork it and do so!

## Requirements
1. Runs on AWS Infrastructure.
2. The website is publicly accessible via the ELB.
3. The website should **not** be publicly accessible unless going through the ELB.
4. Code is documented in some way or another.

**Bonus Points** (not required at all) for *any* of the following:
* Include some form of CI/CD pipeline code. GitHub Actions, Jenkins, or any other tool is fine.
* Have the group of ASG's deliver said application via an ECS Cluster.
* Create and use variables so this can be used in multiple builds.
* Create a method to add linting or verifying that the code meets [Terraform style conventions](https://www.terraform.io/docs/language/syntax/style.html).

## Submission
Please [email a patch](https://thoughtbot.com/blog/send-a-patch-to-someone-using-git-format-patch) of your changes to the email address we sent you this challenge from. This allows us to see how you utilize git but ensures your submission isn't visible to everyone else. Pull Requests and Forks show everyone else your work.
> Note: you'll want to check out a new branch for your work to make correctly formatting the patch easier.
> ```
> git checkout -b my-branch
> ## make your changes, committing along the way
> git format-patch main --stdout > your-name.patch
> ```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb_create_tg"></a> [alb\_create\_tg](#module\_alb\_create\_tg) | ./modules/infra/alb/alb_tg | n/a |
| <a name="module_alb_listener"></a> [alb\_listener](#module\_alb\_listener) | ./modules/infra/alb/alb_listener | n/a |
| <a name="module_alb_sg"></a> [alb\_sg](#module\_alb\_sg) | ./modules/securityGroup | n/a |
| <a name="module_ec2_sg"></a> [ec2\_sg](#module\_ec2\_sg) | ./modules/securityGroup | n/a |
| <a name="module_ec2_tg_attach"></a> [ec2\_tg\_attach](#module\_ec2\_tg\_attach) | ./modules/infra/alb/alb_tg/alb_tg_attach | n/a |
| <a name="module_internet_gateway"></a> [internet\_gateway](#module\_internet\_gateway) | ./modules/network/internetGateway | n/a |
| <a name="module_publicSubnet_IGW_Association"></a> [publicSubnet\_IGW\_Association](#module\_publicSubnet\_IGW\_Association) | ./modules/network/route_table_association | n/a |
| <a name="module_public_alb"></a> [public\_alb](#module\_public\_alb) | ./modules/infra/alb | n/a |
| <a name="module_public_rt"></a> [public\_rt](#module\_public\_rt) | ./modules/network/route_table | n/a |
| <a name="module_public_subnet_1a"></a> [public\_subnet\_1a](#module\_public\_subnet\_1a) | ./modules/network/subnet | n/a |
| <a name="module_public_subnet_1b"></a> [public\_subnet\_1b](#module\_public\_subnet\_1b) | ./modules/network/subnet | n/a |
| <a name="module_ssh_key"></a> [ssh\_key](#module\_ssh\_key) | ./modules/ssh_key | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/network/vpc | n/a |
| <a name="module_webservers"></a> [webservers](#module\_webservers) | ./modules/infra/ec2 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | The default tags to be attached to each resource being created | `map(string)` | <pre>{<br>  "CanBeDeleted": "Yes",<br>  "Owner": "Devansh",<br>  "Purpose": "Development"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ALB_dns"></a> [ALB\_dns](#output\_ALB\_dns) | n/a |
| <a name="output_EC2_IP"></a> [EC2\_IP](#output\_EC2\_IP) | n/a |
<!-- END_TF_DOCS -->