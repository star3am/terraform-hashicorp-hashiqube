# terraform-hashicorp-hashiqube
Terraform Registry Module for HashiQube 

This repo contains a [Terraform](https://www.terraform.io/) module for provisioning [HashiQube](https://servian.github.io/hashiqube) <br />
A __Development__ lab running all [HashiCorp](https://www.hashicorp.com/) products.

__DO NOT USE HASHIQUBE IN PRODUCTION__

[HashiQube at HashiTalks 2020](https://www.hashicorp.com/resources/hashiqube-a-development-lab-using-all-the-hashicorp-products/)

## Purpose
HashiQube has been created to enable anyone interested in secure automation pipelines the ability to run a suite of 'best in class' tools their local machines or in the cloud  at the cost of a small number of system resources. HashiQube gives all interested parties the empowerment to deploy these tools in a way covers multiple use cases effectively providing a 'concept to completion' testbed using open-source HashiCorp products.

- [What is a Terraform module](#what-is-a-terraform-module)
- [How do you use this module](#how-do-you-use-this-module)
    - [Prerequisites](#prerequisites)
    - [Module Inputs](#inputs)

## What is a Terraform module
A Terraform "module" refers to a self-contained package of Terraform configurations that are managed as a group.
For more information around modules refer to the Terraform [documentation](https://www.terraform.io/docs/modules/index.html)

## How do you use this module
A default HashiQube can be provisioned by creating a file _main.tf_ in an empty directory with the following content:

```terraform
module "hashiqube" {
  source   = "star3am/terraform-hashicorp-hashiqube"
  provider = "aws"
}
```

You can then apply this Terraform configuration via:

```bash
terraform init
terraform apply
```

### Prerequisites

To make use of this module, you need a Cloud account.
Currently AWS and GCP is supported with Azure in progress.

- You need a Public/Private SSH key pair. 
- A Cloud account

__Instructions on how to setup a SSH Key pair__: <br />
[SSH Create a Public/Private Key Pair](https://www.ssh.com/ssh/keygen/) <br /><br />
__Instructions on how to setup Cloud Account__: <br />
[Google Cloud Installation and Setup](https://cloud.google.com/deployment-manager/docs/step-by-step-guide/installation-and-setup)<br />
[AWS Cloud Installation and Setup](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)




#### Inputs

| Name | Description | Type | Default | Required | Examples |
|------|-------------|------|---------|----------|---------|
| location | Name of the Cloud provider | `string` | `aws` | no | aws \| gcp |
| whitelist | Whitelisted CIDRs | `list(string)` | `[]` | no | 0.0.0.0/0 | 

#### Outputs

| Name | Description |
|------|-------------|
| ip_address | The IP address of HashiQube instance |