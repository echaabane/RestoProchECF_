# Outputs
output "back_end_lb_dns_name" {
  description = "The DNS name of the back-end load balancer"
  value       = aws_elb.back_lb.dns_name
}

output "front_end_lb_dns_name" {
  description = "The DNS name of the front-end load balancer"
  value       = aws_elb.front_lb.dns_name
}