#
#
# Credentials
access_key = "AKIAIJVNDXFMLSDGK6NQ"
secret_key = "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"

# name of the VPC
vpc_name = "ixVPC"

#Networking
my_cidr_block = "10.0.0.0/16"
# pub0 for data IPSec
pub_sub0 = "10.0.10.0/24"
# pub1 for data Mgmt
pub_sub1 = "10.0.11.0/24"
# private
pri_sub1 = "10.0.1.0/24"
pri_sub2 = "10.0.2.0/24"
pri_sub3 = "10.0.3.0/24"
pri_sub4 = "10.0.4.0/24"
pri_sub5 = "10.0.5.0/24"
pri_sub6 = "10.0.6.0/24"

# Region select: us-west-2 / oregon
region = "us-west-2"
availability_zone = "us-west-2c"
key_pair = "terraformkeypairuswest2"
ubuntu_ami = "ami-005bdb005fb00e791"
vsrx_ami = "ami-0cf5905679d7747fd"
vsrx_instance_type = "c3.xlarge"
# vmx_ami = "ami-00497665"
vmx_ami = "ami-12eaad6a"
vmx_instance_type = "m4.large"

# Region select: london
#region = "eu-west-2"
#srx_ami = "ami-0053111d7a7e064f2"




#ubuntu AMI
#ami = "ami-e0bc5987"
#instance_type = "t2.micro"
#AWS AMI
#ami = "ami-403e2524"
#instance_type = "t2.nano"

#AMI vSRX Oregon ( us-west-2 )
#ami = "ami-cddd71b5"
#AMI vSRX EU region
#ami = "ami-f4958c90"
#srx_ami = "ami-f4958c90"

#AMI vSRX Ohio (us-east-2 )
#srx_ami = "ami-"
