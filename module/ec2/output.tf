output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.my_sg.id
}
output "instance_public_ip" {
  value = aws_instance.myInstance[0]# Output the public IP of the instance
}
# output "instance_id" {
#   value = aws_instance.myInstance.id
# }
