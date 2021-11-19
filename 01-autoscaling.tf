resource "aws_launch_configuration" "example_lg" {
  instance_type   = var.instance_type
  image_id        = var.image_id
  security_groups = [aws_security_group.example_sg.id]
  key_name        = aws_key_pair.example_key.key_name
  #user_data       = data.template_file.setup_apache.rendered
  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install apache2 -y
              EOF
  lifecycle {
    create_before_destroy = true
  }
  

}

resource "aws_autoscaling_group" "name" {
  launch_configuration = aws_launch_configuration.example_lg.id
  min_size             = 3
  max_size             = 10
  #availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  vpc_zone_identifier = data.aws_subnet_ids.default_subnets_ids.ids
  target_group_arns = [aws_lb_target_group.asg_target.arn]
  health_check_type = "ELB"
  tag {
    key                 = "Name"
    value               = "terraform-lb-example-${var.env}"
    propagate_at_launch = true
  }
}

resource "aws_key_pair" "example_key" {
  key_name   = var.key_name
  public_key = var.key_value
}