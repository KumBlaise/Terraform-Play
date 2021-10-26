variable "aws_region" {
  description = "creating a variable to hold the region name value"
  type        = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "creating a vpc network id"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub_sub1_cidr_block" {
  description = "vpc network id"
  type = string
  default = "10.0.0.0/24"
  }
  
variable "priv_sub1_cidr_block" {
  description = "vpc network id"
  type = string
  default = "10.0.1.0/24"
}


variable "aws_instance_type" {
  description = "creating a variable to hold the instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_key_pair" {
  description = "creating a variable to hold the key pair name"
  type        = string
  default     = "Testkeypair"

}