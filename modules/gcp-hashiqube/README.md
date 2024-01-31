## Providers

The following providers are used by this module:

- <a name="provider_external"></a> [external](#provider_external) (~> 2.3)

- <a name="provider_google"></a> [google](#provider_google) (~> 4.66)

- <a name="provider_null"></a> [null](#provider_null) (~> 3.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [google_compute_address.hashiqube](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) (resource)
- [google_compute_firewall.aws_hashiqube_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_firewall.azure_hashiqube_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_firewall.debug_allow_ssh_cidr_range](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_firewall.gcp_hashiqube_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_firewall.my_ipaddress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_firewall.terraform_cloud_api_ip_ranges](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_firewall.terraform_cloud_notifications_ip_ranges](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_firewall.whitelist_cidrs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) (resource)
- [google_compute_instance_template.hashiqube](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template) (resource)
- [google_compute_region_instance_group_manager.hashiqube](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager) (resource)
- [google_project_iam_member.hashiqube](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) (resource)
- [google_service_account.hashiqube](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) (resource)
- [null_resource.debug](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) (resource)
- [null_resource.hashiqube](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) (resource)
- [external_external.myipaddress](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) (data source)
- [google_compute_subnetwork.hashiqube](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_hashiqube_ip"></a> [aws_hashiqube_ip](#input_aws_hashiqube_ip)

Description: AWS Hahiqube IP address

Type: `string`

Default: `null`

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

### <a name="input_gcp_account_id"></a> [gcp_account_id](#input_gcp_account_id)

Description: Account ID

Type: `string`

Default: `"sa-consul-compute-prod"`

### <a name="input_gcp_cluster_description"></a> [gcp_cluster_description](#input_gcp_cluster_description)

Description: the description for the cluster

Type: `string`

Default: `"hashiqube"`

### <a name="input_gcp_cluster_name"></a> [gcp_cluster_name](#input_gcp_cluster_name)

Description: Cluster name

Type: `string`

Default: `"hashiqube"`

### <a name="input_gcp_cluster_size"></a> [gcp_cluster_size](#input_gcp_cluster_size)

Description: size of the cluster

Type: `number`

Default: `1`

### <a name="input_gcp_cluster_tag_name"></a> [gcp_cluster_tag_name](#input_gcp_cluster_tag_name)

Description: Cluster tag to apply

Type: `list(string)`

Default:

```json
[
  "hashiqube"
]
```

### <a name="input_gcp_credentials"></a> [gcp_credentials](#input_gcp_credentials)

Description: GCP project credentials file

Type: `string`

Default: `"~/.gcp/credentials.json"`

### <a name="input_gcp_machine_type"></a> [gcp_machine_type](#input_gcp_machine_type)

Description: GCP Machine Type

Type: `string`

Default: `"n1-standard-1"`

### <a name="input_gcp_project"></a> [gcp_project](#input_gcp_project)

Description: GCP project ID

Type: `string`

Default: `"default"`

### <a name="input_gcp_region"></a> [gcp_region](#input_gcp_region)

Description: The region in which all GCP resources will be launched

Type: `string`

Default: `"australia-southeast1"`

### <a name="input_gcp_root_volume_disk_size_gb"></a> [gcp_root_volume_disk_size_gb](#input_gcp_root_volume_disk_size_gb)

Description: The size, in GB, of the root disk volume on each HashiQube node

Type: `number`

Default: `16`

### <a name="input_gcp_root_volume_disk_type"></a> [gcp_root_volume_disk_type](#input_gcp_root_volume_disk_type)

Description: The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard

Type: `string`

Default: `"pd-standard"`

### <a name="input_gcp_zones"></a> [gcp_zones](#input_gcp_zones)

Description: The zones accross which GCP resources will be launched

Type: `list(string)`

Default:

```json
[
  "australia-southeast1-a",
  "australia-southeast1-b",
  "australia-southeast1-c"
]
```

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

Description: Hashiqube on GCP IP address
