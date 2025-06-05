variable "vpc_cidr" {

  type = string
}

variable "public_subnet_cidr" {

  type = list(any)
}
variable "private_subnet_cidr" {
  type = list(any)

}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "availability_zone" {
  type = list(any)

}

#  variable "public_subnet_id" {
#   type = list(string)
  
#  }
#variable "vpc_id" {
#  type = string
# 
#}

# variable "security_group_id" {
#   description = "Security group ID for the ALB"
#   type        = string
# }