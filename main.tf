resource "kubernetes_namespace" "namespace" {
  count = var.create_namespace == true ? 1 : 0
  metadata {
    annotations = {
      name = var.app_namespace
    }
    name = var.app_namespace
  }
}

module "deploy" {
  source = "git::https://github.com/greg-solutions/terraform_k8s_deploy.git"
  name = var.app_name
  namespace = var.app_namespace
  image = "sonatype/nexus3:${var.image_tag}"
  internal_port = var.ports
  volume_nfs = var.volume_nfs
  volume_host_path = var.volume_host_path
  volume_config_map = var.volume_config_map
  volume_mount = var.volume_mount
}

module "service" {
  source = "git::https://github.com/greg-solutions/terraform_k8s_service.git"
  app_name = var.app_name
  app_namespace = var.app_namespace
  port_mapping = var.ports
}

module "ingress" {
  source = "git::https://github.com/greg-solutions/terraform_k8s_ingress.git"
  app_name = var.app_name
  app_namespace = var.app_namespace
  domain_name = var.domain
  web_internal_port = var.web_internal_port
  tls = var.tls
  annotations = var.ingress_annotations
}