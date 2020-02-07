// main.tf
provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "example" {
ami = data.aws_ami.amazon_linux_latest.id
instance_type = "t2.small"
tags = local.tags 
volume_tags = local.tags
}
locals {
tags = {
Name = "Nandan Srivatava"
ResourceOwner = "nandan.srivastava@hpe.com"
EndDate = "2020-01-25"
BusinessUnit = "CTP-Geo Enablement"
Environment = "dev"
User = "var.lab_username"
}
}

data "aws_ami" "amazon_linux_latest" {
most_recent = true
owners = ["amazon"]
filter {
name = "name"
values = ["amzn-ami-hvm-*"]
}
filter {
name = "virtualization-type"
values = ["hvm"]
}
}
