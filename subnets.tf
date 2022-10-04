/*Subnets*/
resource "aws_subnet" "subnet-reserved" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.sn-reserved[count.index]
  availability_zone = var.azs[count.index]
  tags = {Name = "sn-reserved-${var.sn-zone[count.index]}"}

  count = 3
}
resource "aws_subnet" "subnet-db" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.sn-db[count.index]
  availability_zone = var.azs[count.index]
  tags = {Name = "sn-db-${var.sn-zone[count.index]}"}

  count = 3
}
resource "aws_subnet" "subnet-app" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.sn-app[count.index]
  availability_zone = var.azs[count.index]
  tags = {Name = "sn-app-${var.sn-zone[count.index]}"}

  count = 3
}

resource "aws_subnet" "subnet-web" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.sn-web[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {Name = "sn-web-${var.sn-zone[count.index]}"}

  count = 3
}

