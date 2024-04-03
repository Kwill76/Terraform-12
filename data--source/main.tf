terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

provider "aws" {
  # Configuration options
}

data "aws_instance" "ec2" {
  instance_id = "i-0c8d212b84c6bd341"
}

resource "aws_instance" "demo" {
  ami = data.aws_instance.ec2.ami
  instance_type = data.aws_instance.ec2.instance_type
  key_name = data.aws_instance.ec2.key_name
  
}