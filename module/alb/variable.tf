

 variable "security_group_id" {
   description = "Security group ID for the ALB"
   type        = string
 }

variable "public_subnet_id" {
  description = "Public subnet ID where ALB will be placed"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}
