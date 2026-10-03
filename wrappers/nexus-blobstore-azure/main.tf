module "wrapper" {
  source = "../../modules/nexus-blobstore-azure"

  for_each = var.items

  bucket_configuration = try(each.value.bucket_configuration, var.defaults.bucket_configuration)
  name                 = try(each.value.name, var.defaults.name)
  soft_quota           = try(each.value.soft_quota, var.defaults.soft_quota, null)
}
