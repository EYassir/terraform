resource "aws_vpc" "the_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "vpc_subnetes" {
  count=length(var.subnets)
  vpc_id     = aws_vpc.the_vpc.id
  cidr_block = var.subnets[count.index].cidr 
  availability_zone = var.subnets[count.index].zone
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.the_vpc.id
  tags = {
    Name = "main"
  }
}