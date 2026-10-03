################################################################################
# Blobstore S3
################################################################################
resource "nexus_blobstore_s3" "main" {
  name = var.name

  bucket_configuration {
    bucket {
      name       = var.bucket_configuration.bucket.name
      region     = var.bucket_configuration.bucket.region
      expiration = var.bucket_configuration.bucket.expiration
      prefix     = try(var.bucket_configuration.bucket.prefix, null)
    }

    dynamic "bucket_security" {
      iterator = bucket_security
      for_each = var.bucket_configuration.bucket_security != null ? [var.bucket_configuration.bucket_security] : []

      content {
        access_key_id     = bucket_security.value.access_key_id
        secret_access_key = bucket_security.value.secret_access_key
        role              = bucket_security.value.role
        session_token     = bucket_security.value.session_token
      }
    }

    dynamic "encryption" {
      iterator = encryption
      for_each = var.bucket_configuration.encryption != null ? [var.bucket_configuration.encryption] : []

      content {
        encryption_key  = encryption.value.encryption_key
        encryption_type = encryption.value.encryption_type
      }
    }

    dynamic "advanced_bucket_connection" {
      iterator = advanced_bucket_connection
      for_each = var.bucket_configuration.advanced_bucket_connection != null ? [var.bucket_configuration.advanced_bucket_connection] : []

      content {
        endpoint                 = advanced_bucket_connection.value.endpoint
        force_path_style         = advanced_bucket_connection.value.force_path_style
        max_connection_pool_size = advanced_bucket_connection.value.max_connection_pool_size
        signer_type              = advanced_bucket_connection.value.signer_type
      }
    }
  }

  dynamic "soft_quota" {
    for_each = var.soft_quota != null ? [var.soft_quota] : []

    content {
      limit = var.soft_quota.limit
      type  = var.soft_quota.type
    }
  }
}
