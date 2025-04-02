locals {
  context = var.context
}

# main.tf


module "zabbix_image" {
  source = "git::https://github.com/terraform-zstack-modules/terraform-zstack-image.git"

  create_image        = true
  image_name          = var.image_name
  image_url           = var.image_url
  guest_os_type      = "Centos 8"
  platform           = "Linux"
  format             = "qcow2"
  architecture       = "x86_64"

  backup_storage_name = var.backup_storage_name
}

# 创建虚拟机实例
module "zabbix_instance" {
  source = "git::https://github.com/chijiajian/terraform-zstack-instance.git"

  name                  = var.instance_name
  description           = "zabbix Server Created by Terraform"
  instance_count        = 1
  image_uuid            = module.zabbix_image.image_uuid
  l3_network_name       = var.l3_network_name
  instance_offering_name = var.instance_offering_name

}



