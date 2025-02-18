The Azure Starter App Module extends the functionality of the Dual Backend module by provisioning an Azure Terraform deployment solution that leverages dual backends for Terraform state management. This module sets up a simple yet effective Terraform configuration to deploy Azure resources, ensuring high availability and resilience through the dual backend architecture. 

The Azure Starter App Module integrates GitHub Actions to automate the Terraform core workflow, including Plan, Apply, and Destroy operations for manual executions. It also implements a GitFlow strategy, automatically running terraform plan on pull requests (PRs) and terraform apply on pushes to the main branch. This seamless integration facilitates continuous infrastructure deployment and promotes best practices in infrastructure as code (IaC). 

By combining dual backend state management with automated GitHub Actions workflows, the Azure Starter App Module provides a robust foundation for efficient, secure, and scalable Azure infrastructure deployments, making it an ideal starting point for teams adopting Terraform within the GitHub AT-AT ecosystem.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.10.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app"></a> [app](#module\_app) | ../../modules/azure-starter-app | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of the application to be deployed. This name is used for resource identification and naming conventions within the infrastructure.<br><br>  It's best to keep this short and simple while also ensuring it is easily identifiable and relatively unique within your organization (or at least within the Subscriptions you are targetting). | `string` | n/a | yes |
| <a name="input_azure_nonprod_subscription"></a> [azure\_nonprod\_subscription](#input\_azure\_nonprod\_subscription) | The Azure Subscription ID for the non-production environment where non-production resources will be provisioned. | `string` | n/a | yes |
| <a name="input_azure_prod_subscription"></a> [azure\_prod\_subscription](#input\_azure\_prod\_subscription) | The Azure Subscription ID for the production environment where production resources will be provisioned. | `string` | n/a | yes |
| <a name="input_github_email"></a> [github\_email](#input\_github\_email) | The email address associated with the GitHub account used for committing changes. This is used to attribute commits to the correct user." | `string` | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The GitHub organization under which the repository will be created. This should be the exact name of the GitHub organization. | `string` | n/a | yes |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | The GitHub username that will be used for committing changes to the repository. Ensure this account has the necessary permissions within the GitHub organization." | `string` | n/a | yes |
| <a name="input_nonprod_backend"></a> [nonprod\_backend](#input\_nonprod\_backend) | Configuration for the backend storage used in the non-production environment. Includes resource group, storage account, and container names for Terraform state and plans. | <pre>object({<br>    resource_group_name  = string<br>    storage_account_name = string<br>    state_container_name = string<br>    plan_container_name  = string<br>  })</pre> | n/a | yes |
| <a name="input_prod_backend"></a> [prod\_backend](#input\_prod\_backend) | Configuration for the backend storage used in the production environment. Includes resource group, storage account, and container names for Terraform state and plans. | <pre>object({<br>    resource_group_name  = string<br>    storage_account_name = string<br>    state_container_name = string<br>    plan_container_name  = string<br>  })</pre> | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | A brief description of the GitHub repository. This helps in understanding the purpose and scope of the repository.<br><br>  This should describe the workload represented by the `application_name`. | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository to be created. This name should be unique within the specified GitHub organization.<br><br>  The GitHub repository name should correlate to the `application_name` as it will contain the source code for the infrastructure <br>  that is provisioned to Azure. | `string` | n/a | yes |
| <a name="input_repository_visibility"></a> [repository\_visibility](#input\_repository\_visibility) | The visibility level of the GitHub repository. Accepted values are 'public', 'private', or 'internal'. Determines who can view and access the repository. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Specifies the version of Terraform to use for the deployment. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->