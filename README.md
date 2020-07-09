# External DNS Azure
Setups External DNS on a kubernetes cluster on Azure
```hcl

module "external_dns" {
  source                = "../modules/external_dns"
  resource_group_name   = module.resource_group.name
  azure_client_secret   = var.azure_client_secret
  azure_client_id       = var.azure_client_id
  azure_tenant_id       = var.azure_tenant_id
  azure_subscription_id = var.azure_subscription_id
  namespace             = var.internal_system_namespace
  domain_name           = var.dns_zone_name

  tags = var.tags
}
```


## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| helm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_client\_id | The App ID for your Service Principal/Managed Identity | `string` | n/a | yes |
| azure\_client\_secret | The password/secret for your Service Principal/Managed Identity | `any` | n/a | yes |
| azure\_subscription\_id | The Subscription ID for your Azure Resource group | `string` | n/a | yes |
| azure\_tenant\_id | Azure Tenant ID | `string` | n/a | yes |
| chart\_version | The version of External DNS to install | `string` | `"3.2.3"` | no |
| domain\_name | the DNS Zone to to register for external DNS | `string` | n/a | yes |
| module\_depends\_on | Resources that the module depends on, AKS, namespace creation etc | `any` | `null` | no |
| namespace | The namespace to deploy the external DNS kubernetes object | `string` | `"default"` | no |
| resource\_group\_name | The name of the resource group where the SQL server resides | `string` | n/a | yes |
| tags | Tags to be passed to created instances | `map` | `{}` | no |

## Outputs

No output.
