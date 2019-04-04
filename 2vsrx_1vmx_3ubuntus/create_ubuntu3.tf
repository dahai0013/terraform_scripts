# 4- create an Ubuntu instance
resource "aws_instance" "ubuntu3" {
        ami = "${var.ubuntu_ami}"
        instance_type = "t2.nano"
        key_name = "${var.key_pair}"
        subnet_id = "${aws_subnet.mgmt.id}"
        security_groups = ["${aws_security_group.allow_ssh.id}"]
        availability_zone = "${var.availability_zone}"
        associate_public_ip_address = true
        tags {
         Name = "${var.vpc_name}-Ubuntu3"
        }
}

#6- add Network interface to the vSRX Instance
resource "aws_network_interface" "ubuntu3_eth1" {
    subnet_id       = "${aws_subnet.private6.id}"
    private_ips     = ["10.0.6.22"]
    #security_groups = ["${aws_security_group.allow_IPSec.id}"]
    attachment {
      instance     = "${aws_instance.ubuntu3.id}"
      device_index = 1
    }
    depends_on = ["aws_instance.ubuntu3"]
}