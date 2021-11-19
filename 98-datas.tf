data "aws_vpc" "default" {
  default = true
}

data "template_file" "setup_apache" {
  template = file("${path.module}/resources.d/setup.sh")
}

data "aws_subnet_ids" "default_subnets_ids" {
  vpc_id = module.myvpc_module.the_vpc_id
  #vpc_id = data.aws_vpc.default.id
}


output "the_value"{
  value=data.aws_subnet_ids.default_subnets_ids
}