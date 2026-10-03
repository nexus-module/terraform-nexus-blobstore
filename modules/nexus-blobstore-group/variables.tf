################################################################################
# Blobstore Group
################################################################################
variable "name" {
  description = "Blobstore name"
  type        = string
}

variable "fill_policy" {
  description = "Blobstore name"
  type        = string
}

variable "members" {
  description = "The Azure specific configuration details for the Azure object that'll contain the blob store"
  type        = set(string)
}

variable "soft_quota" {
  description = "Soft quota of the blobstore"
  type = object({
    limit = number
    type  = string
  })
  default = null
}
