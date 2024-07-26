provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/network/vpc"
  cidr_block = "10.0.0.0/16"
  resourceTags  = merge(var.default_tags, { Name = "Challenge VPC" })
}

module "public_subnet_1a" {
  source = "./modules/network/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip = true
  resourceTags  = merge(var.default_tags, { Name = "Challenge Public Subnet 1a" })
}

module "public_subnet_1b" {
  source = "./modules/network/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip = true
  resourceTags  = merge(var.default_tags, { Name = "Challenge Public Subnet 1b" })
}

module "internet_gateway" {
  source = "./modules/network/internetGateway"
  vpc_id = module.vpc.vpc_id
  resourceTags  = merge(var.default_tags, { Name = "Challenge Public Subnet" })
}

module "public_rt" {
  source = "./modules/network/route_table"
  vpc_id = module.vpc.vpc_id
  cidr_block = "0.0.0.0/0"
  gateway_id = module.internet_gateway.igw_id
  
}

module "publicSubnet_IGW_Association" {
  source = "./modules/network/route_table_association"
  subnet_id = local.public_subnet_ids
  route_table_id = module.public_rt.rt_id
}

module "public_alb" {
  source = "./modules/infra/alb"
  subnet_ids = local.public_subnet_ids_list
  resourceTags  = merge(var.default_tags, { Name = "Challenge Public RT" })
  security_groups = module.alb_sg.sg_id
}

module "ssh_key" {
  source = "./modules/ssh_key"
  default_tags = merge(var.default_tags, { Name = "Challenge SSH Key" })
}

module "webservers"{
  source = "./modules/infra/ec2"
  count = 2
  subnet_id = local.public_subnet_ids_list[count.index % length(local.public_subnet_ids_list)]
  resourceTags = merge(var.default_tags, { Name = "Challenge EC2 ${count.index + 1}" })
  security_groups = [ module.ec2_sg.sg_id ]
  ssh_key      = module.ssh_key.ssh_key
}

module "alb_create_tg" {
  source = "./modules/infra/alb/alb_tg"
  vpc_id = module.vpc.vpc_id
  resourceTags  = merge(var.default_tags, { Name = "Challenge Target Group" })
  port = 80
}

module "ec2_tg_attach" {
  source = "./modules/infra/alb/alb_tg/alb_tg_attach"
  tg_arn = module.alb_create_tg.target_group_arn
  count = 2
  ec2_id = module.webservers[count.index].ec2_id
}

module "alb_listener" {
  source = "./modules/infra/alb/alb_listener"
  lb_arn = module.public_alb.alb_arn
  port = 80
  protocol = "HTTP"
  tg_arn = module.alb_create_tg.target_group_arn
  resourceTags  = merge(var.default_tags, { Name = "Challenge ALB Listener" })
}

module "alb_sg" {
  source = "./modules/securityGroup"
  name = "Challenge ALB SG"
  vpc_id = module.vpc.vpc_id
  description = "Security Group of the ALB"

  resourceTags  = merge(var.default_tags, { Name = "Challenge ALB SG" })

  ingress_rules = [
    {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = []
    description = "HTTP traffic"
  }
  ]
    egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
      description     = "Allow all outgoing traffic"
    }
  ]
}

module "ec2_sg" {
  source = "./modules/securityGroup"
  name = "Challenge EC2 SG"
  vpc_id = module.vpc.vpc_id
  description = "Security Group of the EC2 instances"

  resourceTags  = merge(var.default_tags, { Name = "Challenge EC2 SG" })

  ingress_rules = [
    {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = []
    security_groups = [ module.alb_sg.sg_id]
    description = "HTTP traffic"
  },
  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = []
    description = "SSH from anywhere needs to be restricted"
  }
  ]
    egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
      description     = "Allow all outgoing traffic"
    }
  ]
}