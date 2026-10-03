################################################################################
# Blobstore S3
################################################################################
variable "name" {
  description = "Blobstore name"
  type        = string
}

variable "bucket_configuration" {
  description = "The Azure specific configuration details for the Azure object that'll contain the blob store"
  type = object({
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
}

variable "soft_quota" {
  description = "Soft quota of the blobstore"
  type = object({
    limit = number
    type  = string
  })
  default = null
}
