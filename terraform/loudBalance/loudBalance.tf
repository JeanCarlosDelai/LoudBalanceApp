resource "aws_lb" "app_lb" {
  name               = var.loud_balance_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Name = "app-lb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "app-tg"
  }
}

resource "aws_lb_target_group_attachment" "app_lb_attachment_1" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = var.LoudBalanceApp1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_lb_attachment_2" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = var.LoudBalanceApp2_id
  port             = 80
}

resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
