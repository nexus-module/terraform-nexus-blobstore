## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nexus"></a> [nexus](#requirement\_nexus) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nexus"></a> [nexus](#provider\_nexus) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nexus_blobstore_s3.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/blobstore_s3) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_configuration"></a> [bucket\_configuration](#input\_bucket\_configuration) | The Azure specific configuration details for the Azure object that'll contain the blob store | <pre>object({<br>    bucket = object({<br>      name       = string<br>      region     = string<br>      expiration = number<br>      prefix     = optional(string, null)<br>    })<br>    bucket_security = optional(object({<br>      access_key_id     = optional(string, null)<br>      role              = optional(string, null)<br>      secret_access_key = optional(string, null)<br>      session_token     = optional(string, null)<br>    }))<br>    encryption = optional(object({<br>      encryption_key  = optional(string, null)<br>      encryption_type = optional(string, null)<br>    }))<br>    advanced_bucket_connection = optional(object({<br>      endpoint                 = optional(string, null)<br>      force_path_style         = optional(bool, null)<br>      max_connection_pool_size = optional(number, null)<br>      signer_type              = optional(string, null)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Blobstore name | `string` | n/a | yes |
| <a name="input_soft_quota"></a> [soft\_quota](#input\_soft\_quota) | Soft quota of the blobstore | <pre>object({<br>    limit = optional(number)<br>    type  = optional(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the resource. |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nexus"></a> [nexus](#requirement\_nexus) | >= 3.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_nexus"></a> [nexus](#provider\_nexus) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [nexus_blobstore_s3.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/blobstore_s3) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_bucket_configuration"></a> [bucket\_configuration](#input\_bucket\_configuration) | The Azure specific configuration details for the Azure object that'll contain the blob store | <pre>object({<br/>    bucket = object({<br/>      name       = string<br/>      region     = string<br/>      expiration = number<br/>      prefix     = optional(string, null)<br/>    })<br/>    bucket_security = optional(object({<br/>      access_key_id     = optional(string, null)<br/>      role              = optional(string, null)<br/>      secret_access_key = optional(string, null)<br/>      session_token     = optional(string, null)<br/>    }))<br/>    encryption = optional(object({<br/>      encryption_key  = optional(string, null)<br/>      encryption_type = optional(string, null)<br/>    }))<br/>    advanced_bucket_connection = optional(object({<br/>      endpoint                 = optional(string, null)<br/>      force_path_style         = optional(bool, null)<br/>      max_connection_pool_size = optional(number, null)<br/>      signer_type              = optional(string, null)<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Blobstore name | `string` | n/a | yes |
| <a name="input_soft_quota"></a> [soft\_quota](#input\_soft\_quota) | Soft quota of the blobstore | <pre>object({<br/>    limit = number<br/>    type  = string<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_name"></a> [name](#output\_name) | The name of the resource. |
<!-- END_TF_DOCS -->
