output "private_subnet_id" {
    value = aws_subnet.PrivateSubnet1
  
}

output "vpc_id" {
  value = aws_vpc.myVPC.id
}
output "public_subnet_id" {
  value = aws_subnet.PublicSubnet1
}

