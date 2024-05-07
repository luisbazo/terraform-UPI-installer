# OCP UPI Installer with terraform in vsphere 

## Prerequisites

1. Make sure your environment has a DNS and loadbalancer configured to work with masters, infra and workers before attempting the installation. 
2. An NTP server should be available to pass to the configuration files
3. An HTTP server should be available to place the ignition files to boot the cluster

## Download and install the openshift clients

```
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-install-linux.tar.gz

tar xvfz openshift-install-linux.tar.gz

cp ./openshift-install /usr/local/bin

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz

tar xvfz openshift-client-linux.tar.gz

cp ./oc ./kubectl /usr/local/bin

```

## Execute the terraform scripts

To execute the script please check and update deploy-with-terraform.sh, variables.tf and install-config.yaml to adapt to your environment and execute with

```
./deploy-with-terraform.sh
```
