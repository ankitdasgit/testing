variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-west-2"
}

variable "db_instance_identifier" {
  description = "The identifier for the DB instance."
  type        = string
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created."
  type        = string
}

variable "db_username" {
  description = "The username for the DB instance."
  type        = string
}

variable "db_password" {
  description = "The password for the DB instance."
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "The instance class for the DB instance."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the DB instance in gigabytes."
  type        = number
  default     = 20
}

variable "db_engine_version" {
  description = "The version of the database engine to use."
  type        = string
  default     = "8.0"
}

variable "db_backup_retention" {
  description = "The number of days to retain backups for the DB instance."
  type        = number
  default     = 7
}

variable "db_multi_az" {
  description = "Whether the DB instance is multi-AZ."
  type        = bool
  default     = false
}

variable "db_publicly_accessible" {
  description = "Whether the DB instance is publicly accessible."
  type        = bool
  default     = false
}

# variable "vpc_security_group_ids" {
#   description = "The security group IDs to associate with the DB instance."
#   type        = list(string)
# }

variable "subnet_ids" {
  description = "The subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "The DB subnet group to associate with the DB instance."
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "The CIDR blocks allowed to connect to the MySQL instance."
  type        = list(string)
}

variable "environment" {
  description = "The environment (e.g., dev, prod)."
  type        = string
}

variable "vpc_id" {
  description = "value of vpc_id"
  type        = string
}