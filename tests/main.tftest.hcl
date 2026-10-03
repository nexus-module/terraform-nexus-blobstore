mock_provider "nexus" {}

run "creates_one_module_per_item" {
  command = plan

  variables {
    nexus_blobstore_azure = [
      {
        name = "test-name-a"
        bucket_configuration = {
          account_name   = "test-account-name-a"
          container_name = "test-container-name-a"
          authentication = {
            authentication_method = "ACCOUNTKEY"
            account_key           = "test-account-key-a"
          }
        }
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      },
      {
        name = "test-name-b"
        bucket_configuration = {
          account_name   = "test-account-name-b"
          container_name = "test-container-name-b"
          authentication = {
            authentication_method = "ACCOUNTKEY"
            account_key           = "test-account-key-b"
          }
        }
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      }
    ]
    nexus_blobstore_file = [
      {
        name = "test-name-a"
        path = "test-path-a"
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      },
      {
        name = "test-name-b"
        path = "test-path-b"
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      }
    ]
    nexus_blobstore_group = [
      {
        name        = "test-name-a"
        fill_policy = "roundRobin"
        members     = ["test-member-a"]
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      },
      {
        name        = "test-name-b"
        fill_policy = "roundRobin"
        members     = ["test-member-b"]
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      }
    ]
    nexus_blobstore_s3 = [
      {
        name = "test-name-a"
        bucket_configuration = {
          bucket = {
            name       = "test-name-a"
            region     = "test-region-a"
            expiration = 30
            prefix     = "test-prefix-a"
          }
          bucket_security = {
            access_key_id     = "test-access-key-id-a"
            role              = "test-role-a"
            secret_access_key = "test-secret-access-key-a"
            session_token     = "test-session-token-a"
          }
          encryption = {
            encryption_key  = "test-encryption-key-a"
            encryption_type = "s3ManagedEncryption"
          }
          advanced_bucket_connection = {
            endpoint                 = "https://endpoint-a.example.org"
            force_path_style         = true
            max_connection_pool_size = 30
            signer_type              = "test-signer-type-a"
          }
        }
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      },
      {
        name = "test-name-b"
        bucket_configuration = {
          bucket = {
            name       = "test-name-b"
            region     = "test-region-b"
            expiration = 30
            prefix     = "test-prefix-b"
          }
          bucket_security = {
            access_key_id     = "test-access-key-id-b"
            role              = "test-role-b"
            secret_access_key = "test-secret-access-key-b"
            session_token     = "test-session-token-b"
          }
          encryption = {
            encryption_key  = "test-encryption-key-b"
            encryption_type = "s3ManagedEncryption"
          }
          advanced_bucket_connection = {
            endpoint                 = "https://endpoint-b.example.org"
            force_path_style         = true
            max_connection_pool_size = 30
            signer_type              = "test-signer-type-b"
          }
        }
        soft_quota = {
          limit = 1000000
          type  = "spaceRemainingQuota"
        }
      }
    ]
  }

  assert {
    condition     = length(module.nexus_blobstore_azure) == 2
    error_message = "nexus_blobstore_azure must create one nexus-blobstore-azure per item"
  }

  assert {
    condition     = alltrue([for k in ["test-name-a", "test-name-b"] : contains(keys(module.nexus_blobstore_azure), k)])
    error_message = "nexus_blobstore_azure must be keyed by name"
  }

  assert {
    condition     = length(module.nexus_blobstore_file) == 2
    error_message = "nexus_blobstore_file must create one nexus-blobstore-file per item"
  }

  assert {
    condition     = alltrue([for k in ["test-name-a", "test-name-b"] : contains(keys(module.nexus_blobstore_file), k)])
    error_message = "nexus_blobstore_file must be keyed by name"
  }

  assert {
    condition     = length(module.nexus_blobstore_group) == 2
    error_message = "nexus_blobstore_group must create one nexus-blobstore-group per item"
  }

  assert {
    condition     = alltrue([for k in ["test-name-a", "test-name-b"] : contains(keys(module.nexus_blobstore_group), k)])
    error_message = "nexus_blobstore_group must be keyed by name"
  }

  assert {
    condition     = length(module.nexus_blobstore_s3) == 2
    error_message = "nexus_blobstore_s3 must create one nexus-blobstore-s3 per item"
  }

  assert {
    condition     = alltrue([for k in ["test-name-a", "test-name-b"] : contains(keys(module.nexus_blobstore_s3), k)])
    error_message = "nexus_blobstore_s3 must be keyed by name"
  }

}

run "creates_nothing_by_default" {
  command = plan

  assert {
    condition     = length(module.nexus_blobstore_azure) == 0
    error_message = "nexus_blobstore_azure must be empty by default"
  }

  assert {
    condition     = length(module.nexus_blobstore_file) == 0
    error_message = "nexus_blobstore_file must be empty by default"
  }

  assert {
    condition     = length(module.nexus_blobstore_group) == 0
    error_message = "nexus_blobstore_group must be empty by default"
  }

  assert {
    condition     = length(module.nexus_blobstore_s3) == 0
    error_message = "nexus_blobstore_s3 must be empty by default"
  }

}
