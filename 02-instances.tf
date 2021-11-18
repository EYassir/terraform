resource "aws_instance" "example" {
  count           = 2
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.example_key.key_name
  user_data       = data.template_file.user_data.rendered
  security_groups = [aws_security_group.example_sg.name]
}