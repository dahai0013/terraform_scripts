# 5-1 create an vMX instance
resource "aws_instance" "vMX6" {
        ami = "${var.vmx_ami}"
        instance_type = "m4.xlarge"
        #instance_type = "${var.my_vMX1_instance_type}"
        key_name = "${var.key_pair}"
        subnet_id = "${aws_subnet.mgmt.id}"
        security_groups= ["${aws_security_group.allow_ssh.id}"]
        associate_public_ip_address = true
        availability_zone = "${aws_subnet.public.availability_zone }"
        tags {
         Name = "${var.vpc_name}-vMX6"
        }
}

/*# 6-1-0 add Network interface to the vMX1 Instance
resource "aws_network_interface" "vMX1_ge0-0-0" {
  description = "vMX1_ge0-0-0"
  subnet_id       = "${aws_subnet.public.id}"
  private_ips     = ["10.0.10.13"]
  # security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vMX6.id}"
    device_index = 1
  }
}*/

# 6-1-6 add Network interface to the vMX1 Instance
resource "aws_network_interface" "vMX1_ge0-0-0" {
  description = "vMX1_ge0-0-0"
  subnet_id       = "${aws_subnet.private6.id}"
  private_ips     = ["10.0.6.13"]
  #security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vMX6.id}"
    device_index = 1
  }
}

# 6-1-1 add Network interface to the vMX1 Instance
resource "aws_network_interface" "vMX1_ge0-0-1" {
  description = "vMX1_ge0-0-1"
  subnet_id       = "${aws_subnet.private1.id}"
  private_ips     = ["10.0.1.13"]
  # security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vMX6.id}"
    device_index = 2
  }
}

# 6-1-2 add Network interface to the vMX1 Instance
resource "aws_network_interface" "vMX1_ge0-0-2" {
  description = "vMX1_ge0-0-2"
  subnet_id       = "${aws_subnet.private2.id}"
  private_ips     = ["10.0.2.13"]
  #security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vMX6.id}"
    device_index = 3
  }
}

