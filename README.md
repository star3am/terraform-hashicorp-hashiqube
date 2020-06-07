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
    - [Module Outputs](#outputs)

## What is a Terraform module
A Terraform "module" refers to a self-contained package of Terraform configurations that are managed as a group.
For more information around modules refer to the Terraform [documentation](https://www.terraform.io/docs/modules/index.html)

## How do you use this module
A default HashiQube can be provisioned by creating a file _main.tf_ in an empty directory with the following content:

__AWS__
```terraform
module "aws-hashiqube" {
  source    = "../../modules/aws-hashiqube/"
  aws_credentials = "~/.aws/credentials.json"
  ssh_public_key  = "~/.ssh/id_rsa.pub"
}
```

__GCP__
```terraform
module "gcp-hashiqube" {
  source          = "../../modules/gcp-hashiqube"
  gcp_project     = "YOUR_PROJECT_NAME"
  gcp_credentials = "~/.gcp/credentials.json"
  ssh_public_key  = "~/.ssh/id_rsa.pub"
}
```

OR 

__You can just clone this repo, and change directory to example/aws or example/gcp__

You can then apply this Terraform configuration via:

`terraform init`

```
Initializing modules...
- gcp-hashiqube in ../../modules/gcp-hashiqube

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "google" (hashicorp/google) 3.24.0...
- Downloading plugin for provider "external" (hashicorp/external) 1.2.0...
- Downloading plugin for provider "template" (hashicorp/template) 2.1.2...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.external: version = "~> 1.2"
* provider.google: version = "~> 3.24"
* provider.template: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

`terraform apply --auto-approve`

```
module.gcp-hashiqube.data.external.myipaddress: Refreshing state...
module.gcp-hashiqube.data.google_compute_subnetwork.hashiqube: Refreshing state...
module.gcp-hashiqube.google_service_account.hashiqube: Creating...
module.gcp-hashiqube.google_compute_address.hashiqube: Creating...
module.gcp-hashiqube.google_compute_firewall.hashiqube: Creating...
module.gcp-hashiqube.google_service_account.hashiqube: Creation complete after 4s [id=projects/thermal-formula-256223/serviceAccounts/sa-consul-compute-prod@thermal-formula-256223.iam.gserviceaccount.com]
module.gcp-hashiqube.google_project_iam_member.hashiqube: Creating...
module.gcp-hashiqube.google_compute_address.hashiqube: Still creating... [10s elapsed]
module.gcp-hashiqube.google_compute_firewall.hashiqube: Still creating... [10s elapsed]
module.gcp-hashiqube.google_compute_firewall.hashiqube: Creation complete after 13s [id=projects/thermal-formula-256223/global/firewalls/hashiqube-hashiqube]
module.gcp-hashiqube.google_compute_address.hashiqube: Creation complete after 14s [id=projects/thermal-formula-256223/regions/australia-southeast1/addresses/hashiqube]
module.gcp-hashiqube.data.template_file.hashiqube: Refreshing state...
module.gcp-hashiqube.google_compute_instance_template.hashiqube: Creating...
module.gcp-hashiqube.google_project_iam_member.hashiqube: Still creating... [10s elapsed]
module.gcp-hashiqube.google_project_iam_member.hashiqube: Creation complete after 14s [id=thermal-formula-256223/roles/compute.networkViewer/serviceaccount:sa-consul-compute-prod@thermal-formula-256223.iam.gserviceaccount.com]
module.gcp-hashiqube.google_compute_instance_template.hashiqube: Still creating... [10s elapsed]
module.gcp-hashiqube.google_compute_instance_template.hashiqube: Creation complete after 14s [id=projects/thermal-formula-256223/global/instanceTemplates/hashiqube20200607091854711500000001]
module.gcp-hashiqube.google_compute_region_instance_group_manager.hashiqube: Creating...
module.gcp-hashiqube.google_compute_region_instance_group_manager.hashiqube: Still creating... [10s elapsed]
module.gcp-hashiqube.google_compute_region_instance_group_manager.hashiqube: Still creating... [20s elapsed]
module.gcp-hashiqube.google_compute_region_instance_group_manager.hashiqube: Creation complete after 24s [id=projects/thermal-formula-256223/regions/australia-southeast1/instanceGroupManagers/hashiqube]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

hashiqube-01-welcome = Your HashiQube instance is busy launching, usually this takes ~5 minutes.
Below are some links to open in your browser, and commands you can copy and paste in a terminal to login via SSH into your HashiQube instance.
Thank you for using this module, you are most welcome to fork this repository to make it your own.
** DO NOT USE THIS IN PRODUCTION **

hashiqube-02-ip = 34.87.228.156
hashiqube-03-ssh = ssh ubuntu@34.87.228.156
hashiqube-04-consul = http://34.87.228.156:8500
hashiqube-05-nomad = http://34.87.228.156:4646
hashiqube-06-vault = Once you can open http://34.87.228.156:8200 in your browser and you see the Vault website, run the folowing command to get the Initial Root Token for Vault
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ubuntu@34.87.228.156 "grep 'Root Token' /etc/vault/init.file | cut -d ':' -f2 | tr -d ' '"
Copy the Initial Root Token for Vault and use it to login at the Vault address http://34.87.228.156:8200

hashiqube-07-fabio = http://34.87.228.156:9998
```

Now that HashiQube is up, let's SSH into the instance. 
![HashiQube SSH](images/hashiqube-03-ssh.png?raw=true "HashiQube SSH")

Now we can retrieve Vault's Initial Root Token, so let's do that. 
`ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ubuntu@34.87.228.156 "grep 'Root Token' /etc/vault/init.file | cut -d ':' -f2 | tr -d ' '"`
![HashiQube SSH](images/hashiqube-06-vault_initial-root-token.png?raw=true "HashiQube SSH")

Now that we have Vault's Initial Root Token, let's navigate to Vault's login page
![HashiQube Login](images/hhashiqube-06-vault_initial-login.png?raw=true "HashiQube Login")

We can now enter Vault's Initial Root Token to login
![HashiQube Logged in](images/hashiqube-06-vault_initial-logged-in.png?raw=true "HashiQube Logged in")

We can access Hashicorp Consul
![Consul](images/hashiqube-04-consul.png?raw=true "Consul")

We can also access Hashicorp Nomad
![Nomad](images/hashiqube-05-nomad.png?raw=true "Nomad")

We can also access Fabio Load Balancer, running as a Nomad job
![Fabio](images/hashiqube-07-fabio.png?raw=true "Fabio")

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
| whitelist | Whitelisted CIDRs | `string` | `""` | no | 0.0.0.0/0 |

#### Outputs

| Name | Description |
|------|-------------|
| ip_address | The IP address of HashiQube instance |