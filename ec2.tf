data "aws_ami" "ami" { 
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  } 
}

output "ip" {
  value = aws_instance.myec2.public_ip
}

resource "aws_instance" "myec2" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.ami.id
  subnet_id = aws_subnet.subnet-web[0].id
  security_groups = ["${aws_security_group.sg.id}"]
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main-vpc.id
  name = "security group web"
  dynamic "ingress" {
    for_each = var.sg-ports
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "-1"
  }


}
