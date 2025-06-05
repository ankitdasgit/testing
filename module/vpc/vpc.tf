
resource "aws_vpc" "myVPC" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    tags = {
        Name = "Terraform_vpc"
    }
}


resource "aws_subnet" "PublicSubnet1" {
     count = 2
    vpc_id                  = aws_vpc.myVPC.id  
    cidr_block              = var.public_subnet_cidr[count.index]
    availability_zone = var.availability_zone[count.index]


    
   

    tags = {
        Name = "Public-Subnet-1"
    }
}


resource "aws_subnet" "PrivateSubnet1" {
     count = 2
    vpc_id            = aws_vpc.myVPC.id
    cidr_block        = var.private_subnet_cidr[count.index]
    
   
    availability_zone = var.availability_zone[count.index]
    

    tags = {
        Name = "Private-Subnet-1"
    }
}

# Created Internet Gateway (IGW) for Public Subnet
resource "aws_internet_gateway" "internetGateway" {
    vpc_id = aws_vpc.myVPC.id

    tags = {
        Name = "Internet-Gateway"
    }
}

# Created Public Route Table
resource "aws_route_table" "publicRouteTable" {
    vpc_id = aws_vpc.myVPC.id

    tags = {
        Name = "Public-Route-Table"
    }
}

# Add Route to Internet Gateway in Public Route Table
resource "aws_route" "publicInternetAccess" {
    route_table_id         = aws_route_table.publicRouteTable.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.internetGateway.id
}

# Associated Public Subnet with Public Route Table
resource "aws_route_table_association" "publicSubnetAssociation" {
    count = 2
    subnet_id      = aws_subnet.PublicSubnet1[count.index].id
    route_table_id = aws_route_table.publicRouteTable.id
}

# Created Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
    domain = "vpc"
}

# Created NAT Gateway in Public Subnet
resource "aws_nat_gateway" "natGateway" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id     = aws_subnet.PublicSubnet1[0].id

    depends_on = [aws_internet_gateway.internetGateway]  # Ensure IGW is created first

    tags = {
        Name = "NAT-Gateway"
    }
}

# Created Private Route Table
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.myVPC.id

    tags = {
        Name = "Private-Route-Table"
    }
}

# Add Route to NAT Gateway in Private Route Table
resource "aws_route" "privateNatRoute" {
    route_table_id         = aws_route_table.private_rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = aws_nat_gateway.natGateway.id
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "privateSubnetAssociation" {
    count = 2
    subnet_id      = aws_subnet.PrivateSubnet1[count.index].id
    route_table_id = aws_route_table.private_rt.id
}
