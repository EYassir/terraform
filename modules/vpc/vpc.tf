resource "aws_vpc" "the_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "vpc_subnetes" {
  count=length(var.subnets)
  vpc_id     = aws_vpc.the_vpc.id
  cidr_block = var.subnets[count.index].cidr 
  availability_zone = var.subnets[count.index].zone
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.the_vpc.id
  tags = {
    Name = "main"
  }
}

resource "aws_default_route_table" "r" {
  default_route_table_id = aws_vpc.the_vpc.default_route_table_id
  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}