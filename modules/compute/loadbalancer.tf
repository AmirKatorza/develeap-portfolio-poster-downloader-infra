# Step 1: Create a Target Group
resource "aws_lb_target_group" "main" {
  count    = var.single_target ? 0 : 1
  name     = var.target_group_name
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id
}

# Associate EC2 instances with the Target Group
resource "aws_lb_target_group_attachment" "subnet_a_attachment" {
  count            = var.single_target ? 0 : 1
  target_group_arn = aws_lb_target_group.main[0].arn
  target_id        = var.subnet_a_id
}

resource "aws_lb_target_group_attachment" "subnet_b_attachment" {
  count            = var.single_target ? 0 : 1
  target_group_arn = aws_lb_target_group.main[0].arn
  target_id        = var.subnet_b_id
}

# Step 2: Create the Application Load Balancer (ALB)
resource "aws_lb" "main" {
  count                      = var.single_target ? 0 : 1
  name                       = var.load_balancer_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.web_access_sg.id]
  subnets                    = concat([var.subnet_a_id], var.single_target ? [] : [var.subnet_b_id])
  enable_deletion_protection = false

  tags = {
    Name = var.load_balancer_name
  }
}

# Step 3: Create a Listener for the ALB
resource "aws_lb_listener" "main_listener" {
  count             = var.single_target ? 0 : 1
  load_balancer_arn = aws_lb.main[0].arn
  port              = var.lb_port
  protocol          = var.lb_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main[0].arn
  }
}