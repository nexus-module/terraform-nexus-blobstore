mock_provider "nexus" {}

run "maps_all_inputs_to_resource" {
  command = plan

  variables {
    fill_policy = "roundRobin"
    members     = ["test-member"]
    name        = "test-name"
    soft_quota = {
      limit = 1000000
      type  = "spaceRemainingQuota"
    }
  }

  assert {
    condition     = nexus_blobstore_group.main.name == var.name
    error_message = "name does not match var.name"
  }

  assert {
    condition     = nexus_blobstore_group.main.fill_policy == var.fill_policy
    error_message = "fill_policy does not match var.fill_policy"
  }

  assert {
    condition     = nexus_blobstore_group.main.members == var.members
    error_message = "members does not match var.members"
  }

  assert {
    condition     = nexus_blobstore_group.main.soft_quota[0].limit == var.soft_quota.limit
    error_message = "soft_quota[0].limit does not match var.soft_quota.limit"
  }

  assert {
    condition     = nexus_blobstore_group.main.soft_quota[0].type == var.soft_quota.type
    error_message = "soft_quota[0].type does not match var.soft_quota.type"
  }

}

run "omits_optional_blocks" {
  command = plan

  variables {
    fill_policy = "roundRobin"
    members     = ["test-member"]
    name        = "test-name"
  }

  assert {
    condition     = length(nexus_blobstore_group.main.soft_quota) == 0
    error_message = "soft_quota must be omitted when not set"
  }

}
