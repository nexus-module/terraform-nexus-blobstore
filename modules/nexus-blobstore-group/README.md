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
| [nexus_blobstore_group.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/blobstore_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fill_policy"></a> [fill\_policy](#input\_fill\_policy) | Blobstore name | `string` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | The Azure specific configuration details for the Azure object that'll contain the blob store | `set(string)` | n/a | yes |
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
| [nexus_blobstore_group.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/blobstore_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_fill_policy"></a> [fill\_policy](#input\_fill\_policy) | Blobstore name | `string` | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | The Azure specific configuration details for the Azure object that'll contain the blob store | `set(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Blobstore name | `string` | n/a | yes |
| <a name="input_soft_quota"></a> [soft\_quota](#input\_soft\_quota) | Soft quota of the blobstore | <pre>object({<br/>    limit = number<br/>    type  = string<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_name"></a> [name](#output\_name) | The name of the resource. |
<!-- END_TF_DOCS -->
