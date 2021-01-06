locals {
  io_name = "io_test"
  io_tags = {
    Name = "io_test"
    Env  = "Test"
  }
  home_cidr_block    = ["192.168.17.1/32", "192.168.1.70/32", "192.168.84.1/32"]
  outbound_endpoints = ["0.0.0.0/0"]
}

resource "aws_vpc" "io_test" {
  cidr_block = "10.0.0.0/16"
  tags       = local.io_tags
}

resource "aws_subnet" "io_test" {
  vpc_id     = aws_vpc.io_test.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"
  tags       = local.io_tags
}

resource "aws_security_group" "io_test_ingress" {
  vpc_id = aws_vpc.io_test.id
  tags   = local.io_tags

  ingress {
    description = "SSH inbound from home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.home_cidr_block
  }
}

resource "aws_security_group" "io_test_egress" {
  vpc_id = aws_vpc.io_test.id
  tags   = local.io_tags

  egress {
    description = "Outbound to the internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = local.outbound_endpoints
  }
}