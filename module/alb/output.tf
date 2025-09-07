output "alb_arn" {
  value = aws_lb.demo-alb.arn
}

output "alb_dns_name" {
  value = aws_lb.demo-alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.demo-alb.arn
}

  