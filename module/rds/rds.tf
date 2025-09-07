resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.db_subnet_group_name
  description = "Database subnet group"

  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "adarshdb" {
  # Database instance settings
  #identifier        = var.db_instance_identifier
  engine            = "mysql"
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
  parameter_group_name = "default.mysql8.0" # Modify this as per the MySQL version
  publicly_accessible = var.db_publicly_accessible

  # VPC settings
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  multi_az = var.db_multi_az
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name

  # Additional settings
  skip_final_snapshot    = true
  storage_encrypted      = true

  tags = {
    Name = var.db_instance_identifier
    Environment = var.environment
  }
}
