resource "aws_lb" "demo-alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [var.security_group_id]
 subnets           = var.public_subnet_id

  enable_deletion_protection = false

  
}

resource "aws_lb_target_group" "demo-alb" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = var.target_group_name
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.demo-alb.arn
  port              = 80
  protocol         = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-alb.arn
  }
}
