# Create VPC-iGW-VGW + Subnet + Linux and vSRX Instance
#
# 0- AWS access and secret key to access AWS
# 1- create an VPC
# 1a- create an Internet Gateway
# 1b- create an Route in the RT
#
# 1c- create Mgt Security Groups
# 1d- create IPsec Security Groups
#
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





# 1c- create Mgt Security Groups
resource "aws_security_group" "allow_ssh" {
  name = "allow_inbound_SSH"
  description = "Allow inbound SSH traffic from any IP@"
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }
  tags {
    Name = "Allow SSH"
    }
}

# 1d- create IPsec Security Groups
#UDP packets on port 500 (and port 4500 if using NAT traversal)
resource "aws_security_group" "allow_IPSec" {
  name = "allow_inbound_IPSec"
  description = "Allow inbound IPSec traffic from any IP@"
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    from_port = 500
    to_port = 500
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "Allow IPSec"
    }
}



