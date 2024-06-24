provider "aws" {
  region = var.regions
}

resource "aws_instance" "back" {
  count         = 2
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = "BackEndInstance-${count.index}"
  }
}

resource "aws_instance" "front" {
  count         = 2
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = "FrontEndInstance-${count.index}"
  }
}

resource "aws_elb" "back_lb" {
  name               = "back-end-lb"
  availability_zones = ["eu-west-3a"]
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "http:8080/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_instance.back[*].id
}

resource "aws_elb" "front_lb" {
  name               = "front-end-lb"
  availability_zones = ["eu-west-3a"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "http:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_instance.front[*].id
}