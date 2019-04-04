# 5- create an vSRX instance: vSRX2
resource "aws_instance" "vSRX2" {
        ami = "${var.vsrx_ami}"
        instance_type = "${var.vsrx_instance_type}"
        #key_name = "terraformkeypair2"
        key_name = "${var.key_pair}"
        subnet_id = "${aws_subnet.mgmt.id}"
        security_groups= ["${aws_security_group.allow_ssh.id}"]
        associate_public_ip_address = true
        #availability_zone = "${aws_subnet.public.availability_zone }"
        availability_zone = "${var.availability_zone}"
        tags {
         Name = "${var.vpc_name}-vSRX2"
        }
}

/*#6- add Network interface to the vSRX Instance
resource "aws_network_interface" "vSRX2_ge0-0-0" {
  subnet_id       = "${aws_subnet.public.id}"
  private_ips     = ["10.0.10.12"]
  security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vSRX2.id}"
    device_index = 1
  }
  depends_on = ["aws_instance.vSRX1"]
}*/

#6-1-3 add Network interface to the vSRX Instance
resource "aws_network_interface" "vSRX2_ge0-0-0" {
  subnet_id       = "${aws_subnet.private5.id}"
  private_ips     = ["10.0.5.12"]
  #security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vSRX2.id}"
    device_index = 1
  }
  depends_on = ["aws_instance.vSRX1"]
}

#6-1- add Network interface to the vSRX Instance
resource "aws_network_interface" "vSRX2_ge0-0-1" {
  subnet_id       = "${aws_subnet.private1.id}"
  private_ips     = ["10.0.1.12"]
  #security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vSRX2.id}"
    device_index = 2
  }
    depends_on = ["aws_network_interface.vSRX2_ge0-0-0"]
}

#6-1-2 add Network interface to the vSRX Instance
resource "aws_network_interface" "vSRX2_ge0-0-2" {
  subnet_id       = "${aws_subnet.private2.id}"
  private_ips     = ["10.0.2.12"]
  #security_groups = ["${aws_security_group.allow_IPSec.id}"]
  attachment {
    instance     = "${aws_instance.vSRX2.id}"
    device_index = 3
  }
  depends_on = ["aws_network_interface.vSRX2_ge0-0-1"]
}

