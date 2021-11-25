#!/bin/bash

#Install tools
sudo yum install -y jq
cd ~/actions-runner
#Obtain registration token
git_token=curl -u $USER:$TOKEN -X POST -H "Accept: application/vnd.github.v3+json" $REGAPI| jq .token
# Configure runner agent
./config.sh --url $REPOSITORY --token $git_token
sudo ./svc.sh install
sudo ./svc.sh start

exit 0