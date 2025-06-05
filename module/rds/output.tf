output "db_endpoint" {
  description = "The connection endpoint of the RDS instance."
  value       = aws_db_instance.adarshdb.endpoint
}

output "db_instance_id" {
  description = "The DB instance identifier."
  value       = aws_db_instance.adarshdb.id
}

output "rds_sg_id" {
  description = "The ID of the RDS security group."
  value       = aws_security_group.rds_sg.id
}