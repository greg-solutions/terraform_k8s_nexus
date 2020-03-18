module "deploy_nexus" {
  source = "git::https://bitbucket.gregsolutions.dev/scm/gsiaac/terraform_k8s_deploy?ref=v1.0.0"
  region = var.region
  name = var.name
  namespace = var.namespace
  image = var.docker_image
  internal_port = var.ports_mapping
  volume_mount = var.volume_mount
  volume_efs = [
    {
      path_on_efs = var.efs_volume_path
      efs_id = var.efs_id
      volume_name = "nexus-config"
    }
  ]
}