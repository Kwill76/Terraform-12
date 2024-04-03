
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

resource "aws_iam_group" "gp1" {
    name = "manager"
    lifecycle {
      prevent_destroy = false
      
      
    }

}

resource "aws_iam_user" "usr1" {
  name = "kwill2k"
  depends_on = [ aws_iam_group.gp1 ]

}


resource "aws_instance" "sv1" {
  ami = "ami-033a1ebf088e56e81"
  instance_type = "t2.micro"
  key_name = "wordpress"
  lifecycle {
    create_before_destroy = true
  }
}