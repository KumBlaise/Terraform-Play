provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "terra-vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
	Name = "terra-vpc"
  }
}

resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.terra-vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"   
    gateway_id = aws_internet_gateway.terra-igw.id 
  }


}

resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.terra-vpc.id

   tags = {
    Name = "priv_route_table"
  }
}

resource "aws_subnet" "terra_priv_sub1" {
  vpc_id = aws_vpc.terra-vpc.id
  cidr_block = var.priv_sub1_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "terra-priv-sub1"
  }
}

resource "aws_internet_gateway" "terra-igw" {
  vpc_id = aws_vpc.terra-vpc.id

  tags = {
    Name = "terra-igw"
  }
}

resource "aws_subnet" "terra-pub-sub1" {
  vpc_id = aws_vpc.terra-vpc.id
  cidr_block = var.pub_sub1_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "terra-pub-sub1"
  }
}



resource "aws_route_table_association" "pub_association" {
  subnet_id = aws_subnet.terra-pub-sub1.id
  route_table_id = aws_route_table.pub_route_table.id 
}

resource "aws_route_table_association" "priv_association" {
  subnet_id = aws_subnet.terra_priv_sub1.id
  route_table_id = aws_route_table.priv_route_table.id 
}




resource "aws_instance" "pub-sub1" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.aws_instance_type
  key_name = var.instance_key_pair
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-pub-sub1.id
  security_groups = [aws_security_group.terra-web-sg.id]
}


resource "aws_instance" "priv-sub1" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.aws_instance_type
  key_name = var.instance_key_pair
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra_priv_sub1.id
  security_groups = [aws_security_group.terra-web-sg.id]
}


