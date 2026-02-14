# Nexus Blobstore

This module allows you to create **Nexus Blobstore as a global resource** and **individual Nexus Blobstore resources.** For individual examples, see the usage snippets and [examples](https://github.com/nexus-module/terraform-nexus-blobstore/tree/main/examples).

## Provider

You need use a [Nexus provider](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs).

```hcl
provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}
```

## Root module usage

`nexus-blobstore`:

```hcl
module "nexus_blobstore" {
  source  = "nexus-module/blobstore/nexus"

  nexus_blobstore_azure = [
    {
      name = "my-azure-blobstore"

      bucket_configuration = {
        account_name = "example-account-name"
        authentication = {
          authentication_method = "ACCOUNTKEY"
          account_key           = "example-account-key"
        }
        container_name = "example-container-name"
      }

      soft_quota = {
        limit = 1000000
        type  = "spaceRemainingQuota"
      }
    }
  ]

  nexus_blobstore_file = [
    {
      name = "blobstore-file"
      path = "/nexus-data/blobstore-file"

      soft_quota = {
        limit = 1024000000
        type  = "spaceRemainingQuota"
      }
    },
  ]

  nexus_blobstore_group = [
    {
      name        = "group-example"
      fill_policy = "roundRobin"
      members = [
        "one"
      ]
      soft_quota = {
        limit = 1024000000
        type  = "spaceRemainingQuota"
      }
    }
  ]

  nexus_blobstore_s3 = [
    {
      name = "blobstore-s3"

      bucket_configuration = {
        bucket = {
          name       = "aws-bucket-name"
          region     = "us-central-1"
          expiration = -1
        }

        bucket_security = {
          access_key_id     = "my-key-id"
          secret_access_key = "my-access-key"
        }
      }

      soft_quota = {
        limit = 100000
        type  = "spaceRemainingQuota"
      }
    }
  ]
}
```

## Individual module usage

`nexus-blobstore-azure`:

```hcl
module "nexus_blobstore_azure" {
  source  = "nexus-module/blobstore/nexus//modules/nexus_blobstore_azure"

  name = "my-azure-blobstore"

  bucket_configuration = {
    account_name = "example-account-name"
    authentication = {
      authentication_method = "ACCOUNTKEY"
      account_key           = "example-account-key"
    }
    container_name = "example-container-name"
  }

  soft_quota = {
    limit = 1000000
    type  = "spaceRemainingQuota"
  }
}
```

`nexus-blobstore-file`:

```hcl
module "nexus_blobstore_azure" {
  source  = "nexus-module/blobstore/nexus//modules/nexus_blobstore_file"

  name = "blobstore-file"
  path = "/nexus-data/blobstore-file"

  soft_quota = {
    limit = 1024000000
    type  = "spaceRemainingQuota"
  }
}
```

`nexus-blobstore-group`:

```hcl
module "nexus_blobstore_azure" {
  source  = "nexus-module/blobstore/nexus//modules/nexus_blobstore_group"

  name        = "group-example"
  fill_policy = "roundRobin"
  members = [
    nexus_blobstore_file.one.name,
    nexus_blobstore_file.two.name
  ]
}
```

`nexus-blobstore-s3`:

```hcl
module "nexus_blobstore_azure" {
  source  = "nexus-module/blobstore/nexus//modules/nexus_blobstore_s3"

  name = "blobstore-s3"

  bucket_configuration = {
    bucket = {
      name   = "aws-bucket-name"
      region = "us-central-1"
    }

    bucket_security = {
      access_key_id     = "<your-aws-access-key-id>"
      secret_access_key = "<your-aws-secret-access-key>"
    }
  }

  soft_quota = {
    limit = 1024000000
    type  = "spaceRemainingQuota"
  }
}
```

## Terraform Docs

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nexus"></a> [nexus](#requirement\_nexus) | >= 2.0.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nexus_blobstore_azure"></a> [nexus\_blobstore\_azure](#module\_nexus\_blobstore\_azure) | ./modules/nexus-blobstore-azure | n/a |
| <a name="module_nexus_blobstore_file"></a> [nexus\_blobstore\_file](#module\_nexus\_blobstore\_file) | ./modules/nexus-blobstore-file | n/a |
| <a name="module_nexus_blobstore_group"></a> [nexus\_blobstore\_group](#module\_nexus\_blobstore\_group) | ./modules/nexus-blobstore-group | n/a |
| <a name="module_nexus_blobstore_s3"></a> [nexus\_blobstore\_s3](#module\_nexus\_blobstore\_s3) | ./modules/nexus-blobstore-s3 | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nexus_blobstore_azure"></a> [nexus\_blobstore\_azure](#input\_nexus\_blobstore\_azure) | Blobstore Azure. | <pre>list(object({<br>    name = string<br>    bucket_configuration = object({<br>      account_name   = string<br>      container_name = string<br>      authentication = object({<br>        authentication_method = string<br>        account_key           = optional(string)<br>      })<br>    })<br>    soft_quota = optional(object({<br>      limit = optional(number)<br>      type  = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_blobstore_file"></a> [nexus\_blobstore\_file](#input\_nexus\_blobstore\_file) | Blobstore File. | <pre>list(object({<br>    name = string<br>    path = string<br>    soft_quota = object({<br>      limit = optional(number)<br>      type  = optional(string)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_blobstore_group"></a> [nexus\_blobstore\_group](#input\_nexus\_blobstore\_group) | Blobstore Group. | <pre>list(object({<br>    name        = string<br>    fill_policy = string<br>    members     = set(string)<br>    soft_quota = object({<br>      limit = optional(number)<br>      type  = optional(string)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_blobstore_s3"></a> [nexus\_blobstore\_s3](#input\_nexus\_blobstore\_s3) | Blobstore S3. | <pre>list(object({<br>    name = string<br>    bucket_configuration = object({<br>      bucket = object({<br>        name       = string<br>        region     = string<br>        expiration = number<br>        prefix     = optional(string, null)<br>      })<br>      bucket_security = optional(object({<br>        access_key_id     = optional(string, null)<br>        role              = optional(string, null)<br>        secret_access_key = optional(string, null)<br>        session_token     = optional(string, null)<br>      }))<br>      encryption = optional(object({<br>        encryption_key  = optional(string, null)<br>        encryption_type = optional(string, null)<br>      }))<br>      advanced_bucket_connection = optional(object({<br>        endpoint                 = optional(string, null)<br>        force_path_style         = optional(bool, null)<br>        max_connection_pool_size = optional(number, null)<br>        signer_type              = optional(string, null)<br>      }))<br>    })<br>    soft_quota = object({<br>      limit = optional(number)<br>      type  = optional(string)<br>    })<br>  }))</pre> | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_blobstore_azure_name"></a> [blobstore\_azure\_name](#output\_blobstore\_azure\_name) | The name of the blobstore azure. |
| <a name="output_blobstore_file_name"></a> [blobstore\_file\_name](#output\_blobstore\_file\_name) | The name of the blobstore file. |
| <a name="output_blobstore_group_name"></a> [blobstore\_group\_name](#output\_blobstore\_group\_name) | The name of the blobstore group. |
| <a name="output_blobstore_s3_name"></a> [blobstore\_s3\_name](#output\_blobstore\_s3\_name) | The name of the blobstore s3. |

## Authors

Module is maintained by [DevOps IA](https://github.com/devops-ia) with help from [these awesome contributors](https://github.com/nexus-module/terraform-nexus-blobstore/graphs/contributors).
