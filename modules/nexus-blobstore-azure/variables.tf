################################################################################
# Blobstore Azure
################################################################################
variable "name" {
  description = "Blobstore name"
  type        = string
}

variable "bucket_configuration" {
  description = "The Azure specific configuration details for the Azure object that'll contain the blob store"
  type = object({
    account_name   = string
    container_name = string
    authentication = object({
      authentication_method = string
      account_key           = optional(string)
    })
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
