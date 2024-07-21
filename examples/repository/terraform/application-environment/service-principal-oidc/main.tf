data "azurerm_client_config" "current" {
}

resource "random_string" "main" {
  length  = 8
  upper   = false
  special = false
}

locals {
  extended_environments = {
    for key, value in var.environments : key => {
      subscription_id = value
      tenant_id       = data.azuread_client_config.current.tenant_id
      client_id       = azuread_application.identity[key].client_id
      backend         = local.backends[key]
    }
  }
}

module "repo" {

  source  = "Azure-Terraformer/atat/github//modules/repository/terraform/application-environment/service-principal-oidc"
  version = "1.0.1"

  application_name = var.application_name
  name             = var.github_repo
  commit_user      = var.commit_user
  environments     = local.extended_environments

}
