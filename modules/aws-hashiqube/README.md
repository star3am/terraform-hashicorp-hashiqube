## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (~> 4.67)

- <a name="provider_external"></a> [external](#provider_external) (~> 2.3)

- <a name="provider_null"></a> [null](#provider_null) (~> 3.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_eip.hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) (resource)
- [aws_eip_association.eip_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) (resource)
- [aws_iam_instance_profile.hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) (resource)
- [aws_iam_role.hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)
- [aws_iam_role_policy.hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) (resource)
- [aws_instance.hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) (resource)
- [aws_key_pair.hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) (resource)
- [aws_security_group.hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) (resource)
- [aws_security_group_rule.aws_hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.azure_hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.debug_allow_ssh_cidr_range](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.gcp_hashiqube](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.terraform_cloud_api_ip_ranges](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.terraform_cloud_notifications_ip_ranges](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [aws_security_group_rule.whitelist_cidrs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) (resource)
- [null_resource.debug](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) (resource)
- [null_resource.hashiqube](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) (resource)
- [aws_ami.packer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) (data source)
- [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) (data source)
- [external_external.myipaddress](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_instance_root_block_device_size"></a> [aws_instance_root_block_device_size](#input_aws_instance_root_block_device_size)

Description: AWS instance root block device size in Gb

Type: `string`

Default: `"30"`

### <a name="input_aws_instance_root_block_device_type"></a> [aws_instance_root_block_device_type](#input_aws_instance_root_block_device_type)

Description: AWS instance root block device type

Type: `string`

Default: `"gp3"`

### <a name="input_aws_instance_type"></a> [aws_instance_type](#input_aws_instance_type)

Description: AWS instance type

Type: `string`

Default: `"t2.medium"`

### <a name="input_aws_region"></a> [aws_region](#input_aws_region)

Description: The region in which all AWS resources will be launched

Type: `string`

Default: `"ap-southeast-2"`

### <a name="input_azure_hashiqube_ip"></a> [azure_hashiqube_ip](#input_azure_hashiqube_ip)

Description: Azure Hahiqube IP address

Type: `string`

Default: `null`

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

Description: Hashiqube on AWS IP address
