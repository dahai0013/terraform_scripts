# 5-1 create an vMX instance
resource "aws_instance" "vMX2" {
        ami = "${var.vmx_ami}"
        instance_type = "m4.xlarge"
        #instance_type = "${var.my_vMX1_instance_type}"
        key_name = "${var.key_pair}"
        subnet_id = "${aws_subnet.mgmt.id}"
        security_groups= ["${aws_security_group.allow_ssh.id}"]
        associate_public_ip_address = true
        availability_zone = "${aws_subnet.public.availability_zone }"
        tags {
         Name = "${var.vpc_name}-vMX2"
        }
}

# 6-1-6 add Network interface to the vMX2 Instance
resource "aws_network_interface" "vMX2_ge0-0-0" {
  description = "vMX1_ge0-0-0"
  subnet_id       = "${aws_subnet.private6.id}"
  private_ips     = ["10.0.6.12"]
  #security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vMX2.id}"
    device_index = 1
  }
}

# 6-1-1 add Network interface to the vMX2 Instance
resource "aws_network_interface" "vMX2_ge0-0-1" {
  description = "vMX1_ge0-0-1"
  subnet_id       = "${aws_subnet.private5.id}"
  private_ips     = ["10.0.5.12"]
  # security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vMX2.id}"
    device_index = 2
  }
}



