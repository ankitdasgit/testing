# Create IAM Role for SSM
resource "aws_iam_role" "ssm_role" {
  name = "SSM-EC2-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Attach SSM Policy to IAM Role
resource "aws_iam_policy_attachment" "ssm_policy_attach" {
  name       = "SSM-Attach"
  roles      = [aws_iam_role.ssm_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Attach ECR Full Access Policy to IAM Role
resource "aws_iam_policy_attachment" "ecr_policy_attach" {
  name       = "ECR-Full-Access-Attach"
  roles      = [aws_iam_role.ssm_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

# Create IAM Instance Profile
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "Adarsh-Instance-Profile"
  role = aws_iam_role.ssm_role.name
}
