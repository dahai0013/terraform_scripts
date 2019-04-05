# Create VPC-iGW-VGW + Subnet + Linux and vSRX Instance
#
# 0- AWS access and secret key to access AWS
# 1- create an VPC
# 1a- create an Internet Gateway
# 1b- create an Route in the RT
# 1c- create Mgt Security Groups
# 1d- create IPsec Security Groups
# 2a- create Private subnets ( to VM instances ): private1, private2, private3, . . .
# 2b- create Public IPSec subnet ( for Data IPSec Tunnel)
# 2c- create Public Mgmt subnet ( for vSRX Mgmt)
# 2d- associate Public subnet to Main routing table
# 2e- associate Mgmt subnet to Main routing table
# 3- Create an Key pair to access the VM
# 4- create an Ubuntu instance
# 5- create an vSRX instance
# 6- add Network interface to the vSRX Instance
# 7- reboot the vSRX EC2 instannce ( to load the new interfaces )

# define variables and point to terraform.tfvars
variable vpc_name {}
variable my_cidr_block {}
variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable availability_zone {}
variable pub_sub0 {}
variable pub_sub1 {}
variable pri_sub1 {}
variable pri_sub2 {}
variable pri_sub3 {}
variable pri_sub4 {}
variable pri_sub5 {}
variable pri_sub6 {}
variable vsrx_ami {}
variable vsrx_instance_type {}
variable vmx_ami {}
variable vmx_instance_type {}
variable ubuntu_ami {}
variable key_pair {}

# 0- AWS access and secret key to access AWS
provider "aws" {
        access_key = "${var.access_key}"
        secret_key = "${var.secret_key}"
        region = "${var.region}"
}

# 1- create an VPC in aws
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.my_cidr_block }"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags {
    Name = "${var.vpc_name}"
  }
}

# 1a- create an Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.vpc_name}-igw"
  }
}

# 1b- create an Route in the RT
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}


#3- Create an Key pair to access the VM
#resource "aws_key_pair" "admin_key" {
#  key_name   = "admin_key"
#  public_key = "ssh-rsa AAAAB3[…]"
#}


# 7- reboot the vSRX EC2 instannce ( to load the new interfaces )
resource "null_resource" "example1" {
    provisioner "local-exec" {
    command = "python.exe .\reboot-vSRXs.py"
  }
  depends_on = ["aws_network_interface.vSRX1_ge0-0-2"]
}


