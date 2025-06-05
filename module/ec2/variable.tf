variable "ami_id" {
    type = string
  
}
variable "instance_type" {
    type = string
  
}
variable "subnet_id" {
    type = string
  
}
variable "availability_zone" {
    type = list(any)

  
}

variable "myVPC" {
  description = "The VPC to which the security group belongs"
  type        = string
}

