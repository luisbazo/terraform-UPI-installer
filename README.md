# OCP UPI Installer with terraform in vsphere 

Download and install the openshift clients

```
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-install-linux.tar.gz

tar xvfz openshift-install-linux.tar.gz

cp ./openshift-install /usr/local/bin

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz

tar xvfz openshift-client-linux

cp ./oc ./kubectl /usr/local/bin

```


This is a set of terraform scripts to deploy an OCP cluster UPI in vsphere

To execute the script please check and update deploy-with-terraform.sh, variables.tf and install-config.yaml to adapt to your environment and execute with

```
./deploy-with-terraform.sh
```
