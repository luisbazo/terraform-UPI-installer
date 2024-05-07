export OCP_RELEASE="4.14.15"
export CLUSTER_DOMAIN="private.domain.name"
export GOVC_URL='vcenter.private.domain'
export GOVC_USERNAME='administrator@vsphere.local'
export GOVC_PASSWORD='Undercloud.2024'
export GOVC_INSECURE=1
export GOVC_NETWORK='IBM Management Portable'
export VMWARE_SWITCH='DSwitch'
export GOVC_DATASTORE='DSW02SEL1563289-1'
export GOVC_DATACENTER='Madrid05'
export GOVC_RESOURCE_POOL='/Madrid05/host/CT05-undercloud/Resources/UnderCloudResourcePool'  ####default pool
export MYPATH=$(pwd)
export HTTP_SERVER="bastion.private.domain.name"
export SERVER_NTP="10.118.146.3"

#wget https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.14/latest/rhcos-vmware.x86_64.ova
rm -f /var/www/html/ignition/*.ign
rm -rf ${MYPATH}/openshift-install
rm -rf ~/.kube
mkdir ${MYPATH}/openshift-install
mkdir ~/.kube
cp install-config.yaml ${MYPATH}/openshift-install/install-config.yaml
cat > ${MYPATH}/openshift-install/bootstrap-append.ign <<EOF
{
  "ignition": {
    "config": {
      "merge": [
        {
          "source": "http://${HTTP_SERVER}:8080/ignition/bootstrap.ign"
        }
      ]
    },
    "version": "3.1.0"
  }
}
EOF
####################
#Create manifest
##################################
openshift-install create manifests --dir openshift-install --log-level debug
################
#Copy chrony machine config
##########################
sed -i s/SERVERNTP/${SERVER_NTP}/g 99-worker-chrony.bu
sed -i s/SERVERNTP/${SERVER_NTP}/g 99-master-chrony.bu
butane 99-worker-chrony.bu -o 99-worker-chrony.yaml
butane 99-master-chrony.bu -o 99-master-chrony.yaml
cp 99*.yaml openshift-install/manifests
sed -i s/${SERVER_NTP}/SERVERNTP/g 99-worker-chrony.bu
sed -i s/${SERVER_NTP}/SERVERNTP/g 99-master-chrony.bu
########################
#Create ignitions
###########################
openshift-install create ignition-configs --dir  openshift-install --log-level debug
cp ${MYPATH}/openshift-install/*.ign /var/www/html/ignition/
chmod o+r /var/www/html/ignition/*.ign
restorecon -vR /var/www/html/
cp ${MYPATH}/openshift-install/auth/kubeconfig ~/.kube/config

terraform init
terraform plan
terraform apply -auto-approve
openshift-install --dir=openshift-install wait-for bootstrap-complete
openshift-install --dir=openshift-install wait-for bootstrap-complete > /tmp/bootstrap-test 2>&1
grep safe /tmp/bootstrap-test > /dev/null 2>&1
if [ "$?" -ne 0 ]
then
	echo -e "\n\n\nERROR: Bootstrap did not complete in time!"
	echo "Your environment (CPU or network bandwidth) might be"
	echo "too slow. Continue by hand or execute cleanup.sh and"
	echo "start all over again."
	exit 1
fi
echo -e "\n\n[INFO] Completing the installation and approving workers...\n"
for csr in $(oc -n openshift-machine-api get csr | awk '/Pending/ {print $1}'); do oc adm certificate approve $csr;done
sleep 180

for csr in $(oc -n openshift-machine-api get csr | awk '/Pending/ {print $1}'); do oc adm certificate approve $csr;done

openshift-install --dir=openshift-install wait-for install-complete --log-level debug
