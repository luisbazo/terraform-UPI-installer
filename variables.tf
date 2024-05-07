variable "vsphere_user" {
  type    = string
  default = "administrator@vsphere.local"
}
variable "vsphere_password" {
  type    = string
  default = "xxxxxxxxx"
}
variable "vsphere_server" {
  type    = string
  default = "vcenter.private.domain.name"
}
variable "vsphere_net" {
  type    = string
  default = "IBM Management Portable"
}
variable "vsphere_datacenter" {
  type    = string
  default = "Madrid05"
}
variable "vsphere_resource_pool" {
  type    = string
  default = "/Madrid05/host/CT05-undercloud/Resources/UnderCloudResourcePool"
}
variable "vsphere_data_store" {
  type    = string
  default = "datastore-example"
}
variable "vsphere_compute_cluster" {
  type    = string
  default = "CT05-undercloud"
}
variable "vmware_ova_host" {
  type    = string
  default = "undercloud000.private.domain.name"
}
variable "vsphere_folder" {
  type = string
  default = "UnderCloud/UPI"
}

variable "generationDir" {
  type    = string
  default = "openshift-install"
}
## Cluster Details

variable "cluster_name" {
  type    = string
  default = "ocpinstall"
}
variable "domain" {
  type    = string
  default = "private.domain.name"
}
## Cluster VM Counts

variable "master_count" {
  type    = string
  default = "3"
}

variable "worker_count" {
  type    = string
  default = "2"
}

variable "infra_count" {
  type    = string
  default = "3"
}

#############################################################################
## Template VM

variable "template_vm_disk_size" {
  type    = string
  default = "32"
}
variable "template_vm_memory_size" {
  type    = string
  default = "24384"
}
variable "template_vm_cpu_count" {
  type    = string
  default = "4"
}

##Bootstrap VM Configuration

variable "bootstrap_disk_size" {
  type    = string
  default = "32"
}
variable "bootstrap_memory_size" {
  type    = string
  default = "16384"
}
variable "bootstrap_cpu_count" {
  type    = string
  default = "4"
}

variable "bootstrap_vm_network_config" {
  type = map(any)
  default = {
    type      = "static"
    ip        = "10.118.144.164"
    subnet    = "255.255.255.224"
    gateway   = "10.118.146.3"
    interface = "ens192"
    dns       = "10.118.146.3"
    server_id = ""
  }
}

variable "master_cpu_count" {
  type    = string
  default = "4"
}
variable "master_memory_size" {
  type    = string
  default = "16384"
}
variable "master_disk_size" {
  type    = string
  default = "120"
}

variable "worker_cpu_count" {
  type    = string
  default = "4"
}
variable "worker_memory_size" {
  type    = string
  default = "16384"
}
variable "worker_disk_size" {
  type    = string
  default = "120"
}

variable "infra_cpu_count" {
  type    = string
  default = "10"
}
variable "infra_memory_size" {
  type    = string
  default = "26624"
}
variable "infra_disk_size" {
  type    = string
  default = "120"
}

#### Master Nodes - Network Options
variable "master_network_config" {
  type = map(any)
  default = {
    master_0_type      = "static"
    master_0_ip        = "10.118.144.165"
    master_0_subnet    = "255.255.255.224"
    master_0_gateway   = "10.118.146.3"
    master_0_interface = "ens192"
    dns                = "10.118.146.3"
    master_0_server_id = ""

    master_1_type      = "static"
    master_1_ip        = "10.118.144.166"
    master_1_subnet    = "255.255.255.224"
    master_1_gateway   = "10.118.146.3"
    master_1_interface = "ens192"
    dns                = "10.118.146.3"
    master_1_server_id = ""

    master_2_type      = "static"
    master_2_ip        = "10.118.144.167"
    master_2_subnet    = "255.255.255.224"
    master_2_gateway   = "10.118.146.3"
    master_2_interface = "ens192"
    dns                = "10.118.146.3"
    master_2_server_id = ""
  }
}
#### Worker Nodes - Network Options
variable "worker_network_config" {
  type = map(any)
  default = {
    worker_0_type      = "static"
    worker_0_ip        = "10.118.144.171"
    worker_0_subnet    = "255.255.255.224"
    worker_0_gateway   = "10.118.146.3"
    worker_0_interface = "ens192"
    dns                = "10.118.146.3"
    worker_0_server_id = ""

    worker_1_type      = "static"
    worker_1_ip        = "10.118.144.172"
    worker_1_subnet    = "255.255.255.224"
    worker_1_gateway   = "10.118.146.3"
    worker_1_interface = "ens192"
    dns                = "10.118.146.3"
    worker_1_server_id = ""

    worker_2_type      = "static"
    worker_2_ip        = "10.118.144.173"
    worker_2_subnet    = "255.255.255.224"
    worker_2_gateway   = "10.118.146.3"
    worker_2_interface = "ens192"
    dns                = "10.118.146.3"
    worker_2_server_id = ""
  }
}

variable "infra_network_config" {
  type = map(any)
  default = {
    infra_0_type      = "static"
    infra_0_ip        = "10.118.144.168"
    infra_0_subnet    = "255.255.255.224"
    infra_0_gateway   = "10.118.146.3"
    infra_0_interface = "ens192"
    dns                = "10.118.146.3"
    infra_0_server_id = ""

    infra_1_type      = "static"
    infra_1_ip        = "10.118.144.169"
    infra_1_subnet    = "255.255.255.224"
    infra_1_gateway   = "10.118.146.3"
    infra_1_interface = "ens192"
    dns                = "10.118.146.3"
    infra_1_server_id = ""

    infra_2_type      = "static"
    infra_2_ip        = "10.118.144.170"
    infra_2_subnet    = "255.255.255.224"
    infra_2_gateway   = "10.118.146.3"
    infra_2_interface = "ens192"
    dns                = "10.118.146.3"
    infra_2_server_id = ""
  }
}
