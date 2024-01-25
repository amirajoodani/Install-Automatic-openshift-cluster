#!/bin/bash

echo " Enter Your vm IP :"
 
read ip 

########################################################
sudo yum -y install docker

if [ $? -eq 0 ];then
	echo "######################## Docker Installed  ####################"
else
	echo "######################## Failed to Installed  Docker ###########"
	exit 1
fi
#######################################################
systemctl enable docker

if [ $? -eq 0 ];then
	echo "######################## Docker Enabled ####################"
else
	echo "######################## Failed to Enable  Docker ###########"
	exit 1
fi
#######################################################
cat << EOF >/etc/docker/daemon.json
{
 "insecure-registries": [
 "172.30.0.0/16"
 ]
}
EOF

if [ $? -eq 0 ];then
        echo "######################## Private Registery added  ####################"
else
        echo "######################## Failed to add Private registery ###########"
        exit 1
fi
########################################################
systemctl restart docker

if [ $? -eq 0 ];then
        echo "######################## Docker restarted ####################"
else
        echo "######################## Failed to restart  Docker ###########"
        exit 1
fi
########################################################
firewall-cmd --permanent --new-zone dockerc
firewall-cmd --permanent --zone dockerc --add-source 172.17.0.0/16
firewall-cmd --permanent --zone dockerc --add-port 8443/tcp
firewall-cmd --permanent --add-port 8443/tcp
firewall-cmd --permanent --zone dockerc --add-port 53/udp
firewall-cmd --permanent --zone dockerc --add-port 8053/udp
firewall-cmd --reload


if [ $? -eq 0 ];then
        echo "######################## Firewall Rules added ####################"
else
        echo "######################## Failed to add Firewall Rules ###########"
        exit 1
fi
#########################################################
yum -y install centos-release-openshift-origin39 origin-clients


if [ $? -eq 0 ];then
        echo "######################## Openshift packages Installed  ####################"
else
        echo "######################## Failed to Installed openshift packages ###########"
        exit 1
fi
##########################################################
oc cluster up --public-hostname=$ip
