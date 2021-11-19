
resource "aws_lb" "example_alb" {
  name               = "terraform-asg-example"
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.default_subnets_ids.ids
  security_groups = [ aws_security_group.example_sg_for_lb.id ]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 80
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

resource "aws_lb_target_group" "asg_target" {

  name = aws_lb.example_alb.name
  vpc_id = module.myvpc_module.the_vpc_id

  port     = 80
  protocol = "HTTP"
  
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}


resource "aws_lb_listener_rule" "asg_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg_target.arn
  }
}