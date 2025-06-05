variable "vpc_cidr" {
  type = string
  }

variable "public_subnet_cidr" {
  type = list(any)
}
variable "private_subnet_cidr" {
    type = list(any)
    
}
variable "availability_zone" {
  type = list(any)
  
}
#variable "public_subnet_id" {
 #type = list(string)
#
#}