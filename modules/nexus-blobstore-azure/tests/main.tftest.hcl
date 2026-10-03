mock_provider "nexus" {}

run "maps_all_inputs_to_resource" {
  command = plan

  variables {
    bucket_configuration = {
      account_name   = "test-account-name"
      container_name = "test-container-name"
      authentication = {
        authentication_method = "ACCOUNTKEY"
        account_key           = "test-account-key"
      }
    }
    name = "test-name"
    soft_quota = {
      limit = 1000000
      type  = "spaceRemainingQuota"
    }
  }

  assert {
    condition     = nexus_blobstore_azure.main.name == var.name
    error_message = "name does not match var.name"
  }

  assert {
    condition     = nexus_blobstore_azure.main.bucket_configuration[0].account_name == var.bucket_configuration.account_name
    error_message = "bucket_configuration[0].account_name does not match var.bucket_configuration.account_name"
  }

  assert {
    condition     = nexus_blobstore_azure.main.bucket_configuration[0].container_name == var.bucket_configuration.container_name
    error_message = "bucket_configuration[0].container_name does not match var.bucket_configuration.container_name"
  }

  assert {
    condition     = nexus_blobstore_azure.main.bucket_configuration[0].authentication[0].authentication_method == var.bucket_configuration.authentication.authentication_method
    error_message = "bucket_configuration[0].authentication[0].authentication_method does not match var.bucket_configuration.authentication.authentication_method"
  }

  assert {
    condition     = nexus_blobstore_azure.main.bucket_configuration[0].authentication[0].account_key == var.bucket_configuration.authentication.account_key
    error_message = "bucket_configuration[0].authentication[0].account_key does not match var.bucket_configuration.authentication.account_key"
  }

  assert {
    condition     = nexus_blobstore_azure.main.soft_quota[0].limit == var.soft_quota.limit
    error_message = "soft_quota[0].limit does not match var.soft_quota.limit"
  }

  assert {
    condition     = nexus_blobstore_azure.main.soft_quota[0].type == var.soft_quota.type
    error_message = "soft_quota[0].type does not match var.soft_quota.type"
  }

}

run "omits_optional_blocks" {
  command = plan

  variables {
    bucket_configuration = {
      account_name   = "test-account-name"
      container_name = "test-container-name"
      authentication = {
        authentication_method = "ACCOUNTKEY"
      }
    }
    name = "test-name"
  }

  assert {
    condition     = length(nexus_blobstore_azure.main.soft_quota) == 0
    error_message = "soft_quota must be omitted when not set"
  }

}
