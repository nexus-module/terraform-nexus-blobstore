################################################################################
# Blobstore Azure
################################################################################
variable "nexus_blobstore_azure" {
  description = "Blobstore Azure."
  type = list(object({
    name = string
    bucket_configuration = object({
      account_name   = string
      container_name = string
      authentication = object({
        authentication_method = string
        account_key           = optional(string)
      })
    })
    soft_quota = optional(object({
      limit = number
      type  = string
    }))
  }))
  default = []
}

################################################################################
# Blobstore File
################################################################################
variable "nexus_blobstore_file" {
  description = "Blobstore File."
  type = list(object({
    name = string
    path = string
    soft_quota = optional(object({
      limit = number
      type  = string
    }))
  }))
  default = []
}

################################################################################
# Blobstore Group
################################################################################
variable "nexus_blobstore_group" {
  description = "Blobstore Group."
  type = list(object({
    name        = string
    fill_policy = string
    members     = set(string)
    soft_quota = optional(object({
      limit = number
      type  = string
    }))
  }))
  default = []
}

################################################################################
# Blobstore S3
################################################################################
variable "nexus_blobstore_s3" {
  description = "Blobstore S3."
  type = list(object({
    name = string
    bucket_configuration = object({
      bucket = object({
        name       = string
        region     = string
        expiration = number
        prefix     = optional(string, null)
      })
      bucket_security = optional(object({
        access_key_id     = optional(string, null)
        role              = optional(string, null)
        secret_access_key = optional(string, null)
        session_token     = optional(string, null)
      }))
      encryption = optional(object({
        encryption_key  = optional(string, null)
        encryption_type = optional(string, null)
      }))
      advanced_bucket_connection = optional(object({
        endpoint                 = optional(string, null)
        force_path_style         = optional(bool, null)
        max_connection_pool_size = optional(number, null)
        signer_type              = optional(string, null)
      }))
    })
    soft_quota = optional(object({
      limit = number
      type  = string
    }))
  }))
  default = []
}
