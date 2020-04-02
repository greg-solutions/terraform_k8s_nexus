module "nexys" {
  source = "../"
  domain = "example.com"
  volume_nfs = [{
    path_on_nfs = "/"
    nfs_endpoint = "10.10.0.100"
    volume_name = "data"
  }]
  volume_mount = [{
    mount_path = "/nexus-data"
    sub_path = "nexus"
    volume_name = "data"
  }]
}