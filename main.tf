data azurerm_resource_group "rg" {
  name = var.resource_group_name
}

# External DNS Deployment using Helm
resource "helm_release" "external_dns" {
  name             = "external-dns"
  repository       = "https://charts.bitnami.com"
  chart            = "external-dns"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = true

  set {
    name  = "provider"
    value = "azure"
  }

  set {
    name  = "azure.resourceGroup"
    value = data.azurerm_resource_group.rg.name
  }

  set {
    name  = "azure.tenantId"
    value = var.azure_tenant_id
  }

  set {
    name  = "azure.subscriptionId"
    value = var.azure_subscription_id
  }

  set {
    name  = "azure.aadClientId"
    value = var.azure_client_id
  }

  set {
    name  = "azure.aadClientSecret"
    value = var.azure_client_secret
  }

  # TODO Use dynamic block to set domain names
  set {
    name  = "domainFilters[0]"
    value = var.domain_name
  }

  # TODO Add tags using dynamic block
  # https://github.com/hashicorp/terraform/issues/22340
  #  dynamic "set" {
  #    for_each = var.tags
  #    iterator = "tag"
  #    name     = "podLabels[${index(var.tags, tag.key)}]"
  #    value    = tag.value
  #  }


  depends_on = [var.module_depends_on]
}
