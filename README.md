# Create an infrastructure made of vSRX, vMX, Ubuntu, and many more using Terraform on AWS and other

This Terraform script ( or family of script ) of terraform script address the challenge of having to create and modify

because of the high cost of AWS ( and other in the future: Azure will be next ) we can't spin up all the instances
but instead we have to fit the infrastructure as close of possible to the need.

 1- single vSRX and two Ubuntu
 2- two vSRX and two Ubuntu
 3- two vSRX, single vMX and three Ubuntu
 4- two vMX and two Ubuntu
 5- single vSRX, single third party FW ( Fortinet, Palo Alto, ... ) and two Ubuntu
 6- . . .

  the script use one of the cheapest AWS region , but that can be changed


## Getting Started

    Phase 1- Create and AWS account ( to log into the AWS's GUI called "console" )
    Phase 2- Create credential for the script to log into AWS
    Phase 3- Create a key pair on the AWS GUI ( to log into the instance like: vSRX, vMX or Ubuntu )
    Phase 4- Choose an Infrastructure and run the script ( on windows terraform.exe apply )
    Phase 5-  --------- Need to reboot the vSRX and vMX on the AWS GUI ----------
    Phase 6- log into the instance with the key-pair created on the AWS GUI ( called AWS console )

## Prerequisites

    1-Need terraform.exe downloaded on the windows ( or other ) laptop


## Phase 1

    1-
    2-
    3-

## Phase 2


 Create VPC-iGW-VGW + Subnet + Linux and vSRX Instance

 0- AWS access and secret key to access AWS

 1- create an VPC
 1a- create an Internet Gateway
 1b- create an Route in the RT ( for the management )

 1c- Security Groups ( for Management, IPSec, ... )

 create Subnets:
 2a- create Private subnets ( to VM instances ): private1, private2, private3, . . .
 2b- create Public IPSec subnet ( for Data IPSec Tunnel)
 2c- create Public Mgmt subnet ( for vSRX Mgmt)
 2d- associate Public subnet to Main routing table
 2e- associate Mgmt subnet to Main routing table

 3- Create an Key pair to access the VM  <<<<<<<<<<<<< not use at this stage , but will be ( done on the AWS GUI )

 4- create an Ubuntu instance
 5- create an vSRX instance
 6- create en vMX instance
 7- add Network interface to the vSRX / vMX Instance

 8- reboot the vSRX EC2 instance ( to load the new interfaces )




##  python script manual information:

on windows:

terraform.exe init ( the first time )
terraform.exe plan (
terraform.exe apply  ( answer: "yes" ) and will create the Infrastructure

ssh

terraform.exe destroy ( answer: "yes" )  to remove the infrastructure




## Contributing

Everyone is welcome ;-)


## Versioning

Beta version

## Authors

* Me, Myself and I ( https://www.youtube.com/watch?v=P8-9mY-JACM )


## License

Free Code Forever and Wakanda.

## Acknowledgments

* Python Team and Linus Torvalds
* Youtuber, Blogger and contributor of all type
* and You