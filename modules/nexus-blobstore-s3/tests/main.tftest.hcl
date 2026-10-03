mock_provider "nexus" {}

run "maps_all_inputs_to_resource" {
  command = plan

  variables {
    bucket_configuration = {
      bucket = {
        name       = "test-name"
        region     = "test-region"
        expiration = 30
        prefix     = "test-prefix"
      }
      bucket_security = {
        access_key_id     = "test-access-key-id"
        role              = "test-role"
        secret_access_key = "test-secret-access-key"
        session_token     = "test-session-token"
      }
      encryption = {
        encryption_key  = "test-encryption-key"
        encryption_type = "s3ManagedEncryption"
      }
      advanced_bucket_connection = {
        endpoint                 = "https://endpoint.example.org"
        force_path_style         = true
        max_connection_pool_size = 30
        signer_type              = "test-signer-type"
      }
    }
    name = "test-name"
    soft_quota = {
      limit = 1000000
      type  = "spaceRemainingQuota"
    }
  }

  assert {
    condition     = nexus_blobstore_s3.main.name == var.name
    error_message = "name does not match var.name"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].bucket[0].name == var.bucket_configuration.bucket.name
    error_message = "bucket_configuration[0].bucket[0].name does not match var.bucket_configuration.bucket.name"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].bucket[0].region == var.bucket_configuration.bucket.region
    error_message = "bucket_configuration[0].bucket[0].region does not match var.bucket_configuration.bucket.region"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].bucket[0].expiration == var.bucket_configuration.bucket.expiration
    error_message = "bucket_configuration[0].bucket[0].expiration does not match var.bucket_configuration.bucket.expiration"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].bucket_security[0].access_key_id == var.bucket_configuration.bucket_security.access_key_id
    error_message = "bucket_configuration[0].bucket_security[0].access_key_id does not match var.bucket_configuration.bucket_security.access_key_id"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].bucket_security[0].secret_access_key == var.bucket_configuration.bucket_security.secret_access_key
    error_message = "bucket_configuration[0].bucket_security[0].secret_access_key does not match var.bucket_configuration.bucket_security.secret_access_key"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].bucket_security[0].role == var.bucket_configuration.bucket_security.role
    error_message = "bucket_configuration[0].bucket_security[0].role does not match var.bucket_configuration.bucket_security.role"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].bucket_security[0].session_token == var.bucket_configuration.bucket_security.session_token
    error_message = "bucket_configuration[0].bucket_security[0].session_token does not match var.bucket_configuration.bucket_security.session_token"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].encryption[0].encryption_key == var.bucket_configuration.encryption.encryption_key
    error_message = "bucket_configuration[0].encryption[0].encryption_key does not match var.bucket_configuration.encryption.encryption_key"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].encryption[0].encryption_type == var.bucket_configuration.encryption.encryption_type
    error_message = "bucket_configuration[0].encryption[0].encryption_type does not match var.bucket_configuration.encryption.encryption_type"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].advanced_bucket_connection[0].endpoint == var.bucket_configuration.advanced_bucket_connection.endpoint
    error_message = "bucket_configuration[0].advanced_bucket_connection[0].endpoint does not match var.bucket_configuration.advanced_bucket_connection.endpoint"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].advanced_bucket_connection[0].force_path_style == var.bucket_configuration.advanced_bucket_connection.force_path_style
    error_message = "bucket_configuration[0].advanced_bucket_connection[0].force_path_style does not match var.bucket_configuration.advanced_bucket_connection.force_path_style"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].advanced_bucket_connection[0].max_connection_pool_size == var.bucket_configuration.advanced_bucket_connection.max_connection_pool_size
    error_message = "bucket_configuration[0].advanced_bucket_connection[0].max_connection_pool_size does not match var.bucket_configuration.advanced_bucket_connection.max_connection_pool_size"
  }

  assert {
    condition     = nexus_blobstore_s3.main.bucket_configuration[0].advanced_bucket_connection[0].signer_type == var.bucket_configuration.advanced_bucket_connection.signer_type
    error_message = "bucket_configuration[0].advanced_bucket_connection[0].signer_type does not match var.bucket_configuration.advanced_bucket_connection.signer_type"
  }

  assert {
    condition     = nexus_blobstore_s3.main.soft_quota[0].limit == var.soft_quota.limit
    error_message = "soft_quota[0].limit does not match var.soft_quota.limit"
  }

  assert {
    condition     = nexus_blobstore_s3.main.soft_quota[0].type == var.soft_quota.type
    error_message = "soft_quota[0].type does not match var.soft_quota.type"
  }

}

run "omits_optional_blocks" {
  command = plan

  variables {
    bucket_configuration = {
      bucket = {
        name       = "test-name"
        region     = "test-region"
        expiration = 30
      }
    }
    name = "test-name"
  }

  assert {
    condition     = length(nexus_blobstore_s3.main.bucket_configuration[0].bucket_security) == 0
    error_message = "bucket_configuration[0].bucket_security must be omitted when not set"
  }

  assert {
    condition     = length(nexus_blobstore_s3.main.bucket_configuration[0].encryption) == 0
    error_message = "bucket_configuration[0].encryption must be omitted when not set"
  }

  assert {
    condition     = length(nexus_blobstore_s3.main.bucket_configuration[0].advanced_bucket_connection) == 0
    error_message = "bucket_configuration[0].advanced_bucket_connection must be omitted when not set"
  }

  assert {
    condition     = length(nexus_blobstore_s3.main.soft_quota) == 0
    error_message = "soft_quota must be omitted when not set"
  }

}
