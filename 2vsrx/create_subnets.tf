# Create VPC-iGW-VGW + Subnet + Linux and vSRX Instance
# 0- AWS access and secret key to access AWS
# 1- create an VPC
# 1a- create an Internet Gateway
# 1b- create an Route in the RT
# 1c- create Mgt Security Groups
# 1d- create IPsec Security Groups
#
# 2a- create Private subnets ( to VM instances ): private1, private2, private3, . . .
# 2b- create Public IPSec subnet ( for Data IPSec Tunnel)
# 2c- create Public Mgmt subnet ( for vSRX Mgmt)
# 2d- associate Public subnet to Main routing table
# 2e- associate Mgmt subnet to Main routing table
#
# 3- Create an Key pair to access the VM
# 4- create an Ubuntu instance
# 5- create an vSRX instance
# 6- add Network interface to the vSRX Instance


# 2a-1 create Private subnet1 ( to VM instances )
resource "aws_subnet" "private1" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pri_sub1}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-private1"
  }
}
# 2a-2 create Private subnet2 ( to VM instances )
resource "aws_subnet" "private2" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pri_sub2}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-private2"
  }
}
# 2a-3 create Private subnet3 ( to VM instances )
resource "aws_subnet" "private3" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pri_sub3}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-private3"
  }
}
# 2a-4 create Private subnet4 ( to VM instances )
resource "aws_subnet" "private4" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pri_sub4}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-private4"
  }
}
# 2a-5 create Private subnet5 ( to VM instances )
resource "aws_subnet" "private5" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pri_sub5}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-private5"
  }
}

# 2a-5 create Private subnet6 ( to VM instances )
resource "aws_subnet" "private6" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pri_sub6}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-private6"
  }
}

# 2b- create Public IPSec subnet ( for Data IPSec Tunnel )
resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pub_sub0}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-public1"
  }
}

# 2c- create Public Mgmt subnet ( for vSRX Mgmt)
resource "aws_subnet" "mgmt" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.pub_sub1}"
  #availability_zone = "${aws_subnet.public.availability_zone }"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.vpc_name}-Mgmt"
  }
}



# 2d- associate Public subnet to Main routing table
resource "aws_route_table_association" "assoc-public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_vpc.vpc.main_route_table_id}"
  #route_table_id = #"${aws_route_table..id}"
}

# 2e- associate Mgmt subnet to Main routing table
resource "aws_route_table_association" "assoc-mgmt" {
  subnet_id      = "${aws_subnet.mgmt.id}"
  route_table_id = "${aws_vpc.vpc.main_route_table_id}"
  #route_table_id = #"${aws_route_table..id}"
}



