resource "aws_instance" "myInstance" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = false
  count = 1
  availability_zone = var.availability_zone[count.index]
  vpc_security_group_ids = [aws_security_group.my_sg.id]  # Use the security group from security.tf
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

#User data to install NGINX
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Nginx-EC2"
  }
}




