output "the_vpc_id"{
    value=aws_vpc.the_vpc.id
}

output "the_subnets"{
    value=aws_subnet.vpc_subnetes
}