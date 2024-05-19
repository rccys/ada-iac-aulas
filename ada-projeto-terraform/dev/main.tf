resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project_name}-${terraform.workspace}-ecs-cluster"

  tags = {
    Environment = "${var.project_name}-${terraform.workspace}"
  }
}

resource "aws_lb" "ecs_lb" {
  name               = "${var.project_name}-${terraform.workspace}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ecs_sg.id]
  subnets            = [for subnet in aws_subnet.ecs_subnet : subnet.id]

  tags = {
    Name = "${var.project_name}-${terraform.workspace}-lb"
  }
}

resource "aws_lb_target_group" "ecs_tg" {
  name     = "${var.project_name}-${terraform.workspace}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ecs_vpc.id
  health_check {
    path = "/"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "ecs_listener_front_end" {
  load_balancer_arn = aws_lb.ecs_lb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}