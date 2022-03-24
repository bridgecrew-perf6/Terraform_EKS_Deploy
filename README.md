# EKS Cluster deployment (Terraform)
###What is EKS?
**Amazon Elastic Kubernetes Service** (EKS) is a managed Kubernetes instance by AWS.

### Technologies used:
1. **Terraform:** This is a free open-source **infrastructure as code (IaC)** that helps with automation of deployment, configuration and remote management of servers irrespective of the cloud offering or on-premise.

2. **Github:** To store our finished code and for version control.

Read more [here](https://www.terraform.io/intro)

### Prerequisites:
- An AWS Account; check [here](https://aws.amazon.com/account/sign-up)
- A Github Account
- Terraform installed on your local machine. Find [installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli#install-terraform)

### How to use this repository:
1. Clone this repository
   `git clone https://github.com/ebenezermakinde/Terraform_EKS_Deploy.git `

2. After creating the AWS free Tier account get the access keys; navigate to your username at
top-right corner. click on it select Security credentials > Access Key(Create New Access Keys). Ensure to download the keys for safe keeping.
3. In the `variables.tf` file update the corresponding details from pt. 2
4. Initialize your terraform directory
`terraform init`
5. Run a terraform plan (Optional)
`terraform plan`
6. Run `terraform apply --auto-approve`; `--auto-approve flags` skips interactive approval before applying.

If all goes all your deployment is under way and a state file with be generated. On completion you will see the output of 2 cluster details; see `output.tf` file.

The concept of modules was used for better management as our terraform project becomes complex.

You can nagivate to the amazon web console; search for EKS and 1 custer will be displayed. On clicking that cluster you will notice 2 nodes are deployed in the private subnet created


### Clean Up
Ensure to delete resources not need after this exercise to prevent uncurring charging on your account.
Run `terraform destroy` to destroy all resources altogether or
Run `terraform destroy -target <resource to destroy>` where `<resource to destroy>` is a specific resource you intended to destroy while keeping the others.