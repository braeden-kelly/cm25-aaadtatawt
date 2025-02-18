
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.10.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2"
    }
  }
}
# Configure the GitHub Provider
provider "github" {
  owner = var.github_organization
}
provider "azuread" {}
# LAME
provider "azurerm" {
  features {}
  subscription_id = var.azure_nonprod_subscription
}
