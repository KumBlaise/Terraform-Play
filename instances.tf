resource "aws_instance" "pub-sub1" {
  ami = data.aws_ami.amazon-linux-2.id
  # instance_type = var.aws_instance_type    Replace with instance list
#   instance_type = var.instance_type_list[2] replacing this with variable map
  instance_type = var.instance_type_map["test"]
  key_name = var.instance_key_pair
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-pub-sub1.id
  security_groups = [aws_security_group.terra-web-sg.id]
  count = 4
  user_data = file("install_apache.sh")
  tags = {
    Name = "BlaisePub-${var.instance_rename}-${count.index}"       #string interpolation
  }

# creating a dependency to make the ec2 wait for the security groups to be created b4 the ec2 is created
  depends_on = [
      aws_security_group.terra-web-sg
    
  ]
}

  

resource "aws_instance" "priv-sub1" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = var.aws_instance_type
  key_name = var.instance_key_pair
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra_priv_sub1.id
  security_groups = [aws_security_group.terra-web-sg.id]
  tags = {
    Name = "BlaisePriv"
  }
}
