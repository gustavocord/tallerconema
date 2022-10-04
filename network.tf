resource "aws_vpc" "main-vpc" {
  cidr_block = "10.16.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name = "Main VPC"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id 
  tags = {Name = "Main-igw"}
}

resource "aws_route_table" "rt-table" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


resource "aws_route_table_association" "r-asso" {
  subnet_id = aws_subnet.subnet-web[count.index].id
  route_table_id = aws_route_table.rt-table.id
  count = 3
}