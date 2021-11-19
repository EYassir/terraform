resource "aws_security_group" "example_sg" {
  name = "exemple-sg-web-${var.env}"
  vpc_id = module.myvpc_module.the_vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "allow http port from anywhere"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "allow ssh port from anywhere"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = -1
    from_port   = 0
    to_port     = 0
  }
  

}


resource "aws_security_group" "example_sg_for_lb" {
  name = "exemple-sg-web-lb-${var.env}"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "allow http port from anywhere"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = -1
    from_port   = 0
    to_port     = 0
  }
  vpc_id = module.myvpc_module.the_vpc_id

}
