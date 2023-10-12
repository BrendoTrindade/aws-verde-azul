# Crie um Application Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "BG-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.private_subnet[*].id

  enable_deletion_protection = false
}

# Configure os listeners do ALB para direcionar o tráfego para os grupos de destino
resource "aws_lb_listener" "blue" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "green" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 81
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
    }
  }
}