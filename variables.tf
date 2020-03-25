#variable "efs_volume_path" {}
#variable "namespace" {}
#variable "region" {}
#variable "efs_id" {}

variable "name" {
  default = "nexus"
}

variable "volume_mount" {
  default = [
    {
      mount_path = "/data"
      sub_path = "nexus-config"
      volume_name = "nesus-config"
    }
  ]
}

variable "ports_mapping" {
  default = [
    {
      name = "general-port"
      internal_port = "8081"
    }
  ]
}

variable "docker_image" {
  default = "sonatype/nexus3:3.21.1"
}