# 4- create an Ubuntu instance
resource "aws_instance" "ubuntu1" {
        #ami = "ami-403e2524"
        ami = "${var.ubuntu_ami}"
        instance_type = "t2.nano"
        key_name = "${var.key_pair}"
        #key_name = "terraformkeypair2"
        subnet_id = "${aws_subnet.mgmt.id}"
        security_groups = ["${aws_security_group.allow_ssh.id}"]
        availability_zone = "${var.availability_zone}"
        associate_public_ip_address = true
        tags {
         Name = "${var.vpc_name}-Ubuntu1"
        }
}

#6- add Network interface to the vSRX Instance
resource "aws_network_interface" "ubuntu1_eth1" {
    subnet_id       = "${aws_subnet.private4.id}"
    private_ips     = ["10.0.4.21"]
    #security_groups = ["${aws_security_group.allow_IPSec.id}"]
    attachment {
      instance     = "${aws_instance.ubuntu1.id}"
      device_index = 1
    }
    depends_on = ["aws_instance.ubuntu1"]
}