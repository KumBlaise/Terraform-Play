data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]
 
  filter {
    name  = "name"
    values = ["amzn2-ami-hvm-2.0.*.1-x86_64-gp2"]
  }
  
}