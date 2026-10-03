################################################################################
# Blobstore File
################################################################################
variable "name" {
  description = "Blobstore name"
  type        = string
}

variable "path" {
  description = "The path to the blobstore contents. This can be an absolute path to anywhere on the system nxrm has access to or it can be a path relative to the sonatype-work directory"
  type        = string
  default     = null
}

variable "soft_quota" {
  description = "Soft quota of the blobstore"
  type = object({
    limit = number
    type  = string
  })
  default = null
}
