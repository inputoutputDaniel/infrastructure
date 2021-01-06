locals {
  io_name = "io_test"
  io_tags = {
    Name = local.io_name
    Env = "Test"
  }
    home_cidr_block = ["192.168.17.1/32", "192.168.1.70/32"]
}

resource "aws_vpc" "io_test" {
  cidr_block       = "10.0.0.0/16"
  tags = local.io_tags
}

resource "aws_subnet" "io_test" {
  vpc_id = aws_vpc.io_test.id
  cidr_block = "10.0.1.0/24"
  tags = local.io_tags
}

resource "aws_security_group" "io_test" {
  vpc_id = aws_vpc.io_test.id
  name = local.io_name
  tags = local.io_tags

  ingress {
    description = "SSH inbound from home"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = local.home_cidr_block
  }
}