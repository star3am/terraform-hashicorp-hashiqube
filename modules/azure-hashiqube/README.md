## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) (3.57.0)

- <a name="provider_external"></a> [external](#provider_external) (~> 2.3)

- <a name="provider_null"></a> [null](#provider_null) (~> 3.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_linux_virtual_machine.hashiqube](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/linux_virtual_machine) (resource)
- [azurerm_network_interface.hashiqube](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_interface) (resource)
- [azurerm_network_security_group.aws_hashiqube_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.azure_hashiqube_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.debug_allow_ssh_cidr_range](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.gcp_hashiqube_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.my_ipaddress](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.terraform_cloud_api_ip_ranges](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.terraform_cloud_notifications_ip_ranges](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_network_security_group.whitelist_cidrs](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/network_security_group) (resource)
- [azurerm_public_ip.hashiqube](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/public_ip) (resource)
- [azurerm_resource_group.hashiqube](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/resource_group) (resource)
- [azurerm_subnet.hashiqube](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/subnet) (resource)
- [azurerm_virtual_network.hashiqube](https://registry.terraform.io/providers/hashicorp/azurerm/3.57.0/docs/resources/virtual_network) (resource)
- [null_resource.debug](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) (resource)
- [null_resource.hashiqube](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) (resource)
- [external_external.myipaddress](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_hashiqube_ip"></a> [aws_hashiqube_ip](#input_aws_hashiqube_ip)

Description: AWS Hahiqube IP address

Type: `string`

Default: `null`

### <a name="input_azure_instance_type"></a> [azure_instance_type](#input_azure_instance_type)

Description: Azure instance type

Type: `string`

Default: `"Standard_DS1_v2"`

### <a name="input_azure_region"></a> [azure_region](#input_azure_region)

Description: The region in which all Azure resources will be launched

Type: `string`

Default: `"Australia East"`

### <a name="input_debug_allow_ssh_cidr_range"></a> [debug_allow_ssh_cidr_range](#input_debug_allow_ssh_cidr_range)

Description: CAREFUL! Debug Open SSH port 22 to this CIDR range, use only in emergency

Type: `string`

Default: `""`

### <a name="input_debug_user_data"></a> [debug_user_data](#input_debug_user_data)

Description: Debug Output the User Data of the Cloud instance during Terraform Apply

Type: `bool`

Default: `true`

### <a name="input_deploy_to_aws"></a> [deploy_to_aws](#input_deploy_to_aws)

Description: Deploy Hashiqube on AWS

Type: `bool`

Default: `false`

### <a name="input_deploy_to_azure"></a> [deploy_to_azure](#input_deploy_to_azure)

Description: Deploy Hashiqube on Azure

Type: `bool`

Default: `false`

### <a name="input_deploy_to_gcp"></a> [deploy_to_gcp](#input_deploy_to_gcp)

Description: Deploy Hashiqube on GCP

Type: `bool`

Default: `false`

### <a name="input_docker_version"></a> [docker_version](#input_docker_version)

Description: The Docker version you would like to install

Type: `string`

Default: `"latest"`

### <a name="input_gcp_hashiqube_ip"></a> [gcp_hashiqube_ip](#input_gcp_hashiqube_ip)

Description: GCP Hahiqube IP address

Type: `string`

Default: `null`

### <a name="input_ssh_private_key"></a> [ssh_private_key](#input_ssh_private_key)

Description: Content of your SSH private key, matching the public key above

Type: `string`

Default: `""`

### <a name="input_ssh_public_key"></a> [ssh_public_key](#input_ssh_public_key)

Description: Content of your SSH public key, matching the private key below

Type: `string`

Default: `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAd1E2uJrIFr8PVIMiGvCCdwpL2U+1HqpQ8YVbXCT104SFkYl7IArRmlY9LfGagO9xw/xcAP2gR3e3Bfo1Z4p3ZmbB0E4HqI+9MwRFS86xT9KVqH+anTgTIPAfpjCzoEHk/BMT5/Gzowkn426cMAFz1Fg+Umv9GrHkxPf2+xuoHvjYyibkvvO88lMeTojt/HjTz3QZUL361QCsZxcChAR1/DOvKygCnGEqZ2p4aBvHrEBiyHt1POQJzhtKzG4o14zmzZ5prBHFiyhFdTeqKHtYqgKVhrYPkgALLWZFcl3rSSBZpWTli3NpkfAv98aTyCrljJohUJdJkeL3RxuX6gHN"`

### <a name="input_terraform_cloud_api_ip_ranges"></a> [terraform_cloud_api_ip_ranges](#input_terraform_cloud_api_ip_ranges)

Description: Terraform Cloud API IP Ranges

Type: `list(any)`

Default:

```json
[
  "75.2.98.97/32",
  "99.83.150.238/32"
]
```

### <a name="input_terraform_cloud_notifications_ip_ranges"></a> [terraform_cloud_notifications_ip_ranges](#input_terraform_cloud_notifications_ip_ranges)

Description: Terraform Cloud Notifications IP Ranges

Type: `list(any)`

Default:

```json
[
  "52.86.200.106/32",
  "52.86.201.227/32",
  "52.70.186.109/32",
  "44.236.246.186/32",
  "54.185.161.84/32",
  "44.238.78.236/32"
]
```

### <a name="input_use_packer_image"></a> [use_packer_image](#input_use_packer_image)

Description: Use your own Packer build image?

Type: `bool`

Default: `false`

### <a name="input_vagrant_provisioners"></a> [vagrant_provisioners](#input_vagrant_provisioners)

Description: The list of services you would like to run in Hashiqube, the more you run, the bigger instance youd need with more RAM

Type: `string`

Default: `"basetools,docker,consul,vault,nomad,boundary,waypoint"`

### <a name="input_whitelist_cidrs"></a> [whitelist_cidrs](#input_whitelist_cidrs)

Description: Additional CIDRs to whitelist

Type: `list(any)`

Default:

```json
[
  "52.86.200.106/32",
  "52.86.201.227/32",
  "52.70.186.109/32",
  "44.236.246.186/32",
  "54.185.161.84/32",
  "44.238.78.236/32"
]
```

## Outputs

The following outputs are exported:

### <a name="output_hashiqube_ip"></a> [hashiqube_ip](#output_hashiqube_ip)

Description: Hashiqube on Azure IP address
