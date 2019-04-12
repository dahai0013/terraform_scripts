#
# This script will reboot the AWS instance based on the instance-id
#
# Pre requisite: need to have aws cli installed first!
#

import os
import time

print(time.ctime())
#time.sleep(600)
aws_cmd1 = 'aws ec2 describe-instances  --query "Reservations[].Instances[].InstanceId"  --filter "Name=instance-state-name,Values=running" "Name=image-id,Values=ami-0cf5905679d7747fd" --no-verify --output text > instanceid.txt'
os.system(aws_cmd1)
print(time.ctime())

filename = "instanceid.txt"

try:
    with open(filename, "r") as fp:
        lines = fp.readlines()
        print (lines)
        #cnt = 1

        for line in lines:
            #print("Line {}: {}".format(cnt, line.strip()))
            print("the instance id is: line :" ,line)
            aws_cmd2 = 'aws ec2 reboot-instances --no-verify --instance-ids %s ' %line
            #print (aws_cmd2)
            os.system(aws_cmd2)



    # do stuff here

    # aws ec2 reboot-instances --instance-ids %instance_id% --no-verify


finally:
    fp.close()



