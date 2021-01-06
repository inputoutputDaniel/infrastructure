resource "aws_instance" "webtest01" {
  ami           = "ami-0a0ad6b70e61be944"
  instance_type = "t2.micro"
  key_name      = "io_test"
  subnet_id     = aws_subnet.io_test.id
  vpc_security_group_ids = [
    aws_security_group.io_test_ingress.id,
    aws_security_group.io_test_egress.id,
  ]
  tags = {
    Name = "webtest01"
  }
}

resource "aws_instance" "webtest02" {
  ami           = "ami-0a0ad6b70e61be944"
  instance_type = "t2.micro"
  key_name      = "io_test"
  subnet_id     = aws_subnet.io_test.id
  vpc_security_group_ids = [
    aws_security_group.io_test_ingress.id,
    aws_security_group.io_test_egress.id,
  ]
  tags = {
    Name = "webtest02"
  }
}