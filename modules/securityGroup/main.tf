resource "aws_security_group" "this" {
  name = var.name
  vpc_id = var.vpc_id
  description = var.description

  dynamic "ingress" {
	for_each = var.ingress_rules
	content {
	  from_port = ingress.value.from_port
	  to_port = ingress.value.to_port
	  protocol = ingress.value.protocol
	  cidr_blocks = ingress.value.cidr_blocks
	  security_groups = ingress.value.security_groups
	  description = ingress.value.description
	}
  }
	dynamic "egress" {
  for_each = var.egress_rules
  content {
    from_port       = egress.value.from_port
    to_port         = egress.value.to_port
    protocol        = egress.value.protocol
    cidr_blocks     = egress.value.cidr_blocks
    security_groups = egress.value.security_groups
    description     = egress.value.description
  		}
	}

	tags = var.resourceTags

}

/*
resource "aws_security_group" "dn-sg-usw2-apiservers" {
	name        = "dn-sg-usw2-apiservers"
	description = "api server ports"
	vpc_id      = aws_vpc.challengeVPC.id

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		security_groups = ["sg-015d95f6088e7413c"]
		description = "http traffic"
	}
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "SSH"
	}
	ingress {
		security_groups = ["sg-015d95f6088e7413c"]
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		description = "https traffic"
	}
	ingress {
		from_port   = 9100
		to_port     = 9101
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "Metrics Export"
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
		egress {
		from_port       = 6379
		to_port         = 6379
		protocol        = "tcp"
		cidr_blocks     = ["0.0.0.0/0"]
		description     = "API Servers Connection"
	}
	tags = {
		Name = "dn-sg-usw2-apiservers"
	}
}

resource "aws_security_group" "demoSG" {
	name        = ""
	description = ""
	vpc_id      = "aws_vpc.challengeVPC.id"

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "http traffic"
	}
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "SSH"
	}
	ingress {
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "https traffic"
	}	

	egress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		description = "HTTP traffic"
		security_groups = [""]
	}	
	egress {
		from_port   = 443
		to_port     = 443
		protocol    = "tcp"
		description = "HTTPS traffic"
		security_groups = ["${aws_security_group.dn-sg-usw2-apiservers.id}"]
		# security_groups = "${aws_security_group.dn-sg-usw2-apiservers.id}"
	}

	tags = {
		Name = ""
	}
}

# AWS Subnet Section

*/