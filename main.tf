locals {
  context = var.context
}

# main.tf


module "zabbix_image" {
  source = "git::http://172.20.14.17/jiajian.chi/terraform-zstack-image.git?ref=v1.1.1"

  create_image        = true
  image_name          = var.image_name
  image_url           = var.image_url
  guest_os_type      = "Centos 8"
  platform           = "Linux"
  format             = "qcow2"
  architecture       = "x86_64"
  expunge      = var.expunge
  backup_storage_name = var.backup_storage_name
}

# 创建虚拟机实例
module "zabbix_instance" {
  source = "git::http://172.20.14.17/jiajian.chi/terraform-zstack-instance.git?ref=v1.1.1"

  name                  = var.instance_name
  description           = "zabbix Server Created by Terraform"
  instance_count        = 1
  image_uuid            = module.zabbix_image.image_uuid
  l3_network_name       = var.l3_network_name
  instance_offering_name = var.instance_offering_name
  expunge      = var.expunge
}



