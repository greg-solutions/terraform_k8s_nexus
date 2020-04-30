variable "domain" {
  type = string
  description = "(Required) Domain for the url. Generating url: nexus.[domain]"
}
variable "app_name" {
  type = string
  description = "(Optional) Application name"
  default = "nexus"
}
variable "app_namespace" {
  type = string
  description = "(Optional) Namespace name"
  default = "nexus"
}
variable "namespace_labels" {
  description = "(Optional) Add labels for namespace"
  default = null
}
variable "create_namespace" {
  type = bool
  description = "(Optional) Default 'false' value will create namespace in cluster. If you want use exist namespace set 'false' "
  default = true
}
variable "ports" {
  description = "(Optional) Port mapping"
  default = [
    {
      name = "web-access"
      internal_port = "8081"
      external_port = "80"
    }
  ]
}
variable "web_internal_port" {
  description = "(Optional) Connect URL to Container internal port. !Note! If this value changed, need specify new ports in var.ports"
  default = [
    {
      sub_domain = "nexus."
      internal_port = "8081"
    }
  ]
}
variable "tls" {
  type = list(string)
  description = "(Optional) Define TLS , for use only HTTPS"
  default = []
}
variable "ingress_annotations" {
  description = "(Optional) Set addional annontations for ingress"
  default = {
    "kubernetes.io/ingress.class" = "nginx"
  }
}
variable "image_tag" {
  type = string
  description = "(Optional) Docker image tag for sonatype/nexus3"
  default = "latest"
}
variable "volume_nfs" {
  description = "(Optional) Create NFS volume"
  default = []
}
variable "volume_config_map" {
  description = "(Optional) Create ConfigMap volume"
  default = []
}
variable "volume_host_path" {
  description = "(Optional) Create HostPath volume"
  default = []
}
variable "volume_mount" {
  description = "(Optional) Mount path into volume"
  default = []
}