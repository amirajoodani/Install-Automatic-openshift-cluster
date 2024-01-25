# Installing openshift cluster locally using docker automatically using bash script
In the previous article, we investigated the installation of openshift cluster locally using the CRC method. The mentioned method had limitations that required a lot of resources, which you can read from the link below:<br>
<a href="https://nextdevops.ir/fa/%d9%86%d8%b5%d8%a8-openshift-%d8%a8%d9%87-%d8%b5%d9%88%d8%b1%d8%aa-crc-%d8%af%d8%b1-%d9%84%d9%88%da%a9%d8%a7%d9%84/">Install OpenShift with CRC </a><br>
In this article, we will examine the installation of an openshift cluster on a node using Docker. This method consumes less resources and can be installed in nested virtualization mode. First, we consider the installation of a machine with Centos7 operating system. We consider 4 gigs of RAM and 3 Vcpu for the mentioned machine. In order to simplify the process, we can use the following script, but we will check the installation steps inside the script. After running the script, you will first be asked for the IP address of the system so that it can be used when uploading the cluster. Then we install and activate the Docker service.<br>
Then add a registry to the Docker service daemon. (This step is mandatory). After that, we reset the Docker service and add the firewall rules. Finally, we install the required packages and run the cluster with the IP of the machine with the public-hostname parameter. <br>
```
bash openshift.sh
```
output should like this :<br>
 ![openshift cluster](https://github.com/amirajoodani/Install-Automatic-openshift-cluster/assets/42912741/929c7811-c3ca-4384-9a7d-29324284aaf0)<br>
and web console is accessable form https://IP:8443 <br>
![openshift -web console](https://github.com/amirajoodani/Install-Automatic-openshift-cluster/assets/42912741/eb52956f-c769-47fd-b465-61d67c93aa11)

