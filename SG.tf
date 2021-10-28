resource "aws_security_group" "terra-web-sg" {
  name        = "terra-web-sg"
  description = "Allow web and ssh inbound traffic"
  vpc_id = aws_vpc.terra-vpc.id

  ingress {
      description      = "Allow ssh inbound traffic"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["171.22.76.42/32"]
  
  
}
   
  ingress {
      description      = "Allow http inbound traffic"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
}

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      
}
}