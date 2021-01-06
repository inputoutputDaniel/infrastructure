resource "aws_vpc" "io" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "InputOutput"
  }
}