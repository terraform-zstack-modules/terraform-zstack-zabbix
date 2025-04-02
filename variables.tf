#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}

# 应用配置变量
variable "image_name" {
  description = "Name for the log server image"
  type        = string
  default     = "zabbix-by-terraform"
}

variable "image_url" {
  description = "URL to download the image from"
  type        = string
  default     = "http://minio.zstack.io:9001/packer/zabbix-by-packer-image-compressed.qcow2"
}

variable "backup_storage_name" {
  description = "Name of the backup storage to use"
  type        = string
  default     = "bs"
}

variable "instance_name" {
  description = "Name for the zabbix server instance"
  type        = string
  default     = "zabbix"
}

variable "l3_network_name" {
  description = "Name of the L3 network to use"
  type        = string
  default     = "test"
}

variable "instance_offering_name" {
  description = "Name of the instance offering to use"
  type        = string
  default     = "min"
}

variable "zbx_user" {
  description = "username for Zabbix Admin"
  type        = string
  default     = "Admin"
}

variable "zbxpassword" {
  description = "password for Zabbix Admin"
  type        = string
  default     = "zabbix"
  sensitive   = true
}

variable "port" {
  type        = number
  default     = 80
  description = "The port on which the zabbix will listen"
}
