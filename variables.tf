variable "tags" {
  description = "Tags to be passed to created instances"
  default     = {}
}

variable "module_depends_on" {
  description = "Resources that the module depends on, AKS, namespace creation etc"
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group where the SQL server resides"
  type        = string
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "azure_client_id" {
  description = "The App ID for your Service Principal/Managed Identity"
  type        = string
}

variable "azure_client_secret" {
  description = "The password/secret for your Service Principal/Managed Identity"
}

variable "azure_subscription_id" {
  description = "The Subscription ID for your Azure Resource group"
  type        = string
}

variable "domain_name" {
  description = "the DNS Zone to to register for external DNS"
  type        = string
}

variable "namespace" {
  description = "The namespace to deploy the external DNS kubernetes object"
  default     = "default"
}

variable "chart_version" {
  description = "The version of External DNS to install"
  default     = "3.2.3"
}
