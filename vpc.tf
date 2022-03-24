data "aws_availability_zones" "available" {
  }

  locals {
  cluster_name = "plan-a-cluster-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module vpc {
    source = "terraform-aws-modules/vpc/aws"
    version = "3.2.0"
    name = "Demo-VPC"
    cidr = "10.0.0.0/16"
    azs = data.aws_availability_zones.available.names
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets =  ["10.0.3.0/24", "10.0.4.0/24"]
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true
tags = {
    "Name" = "PlanA-VPC"
}
public_subnet_tags = {
    "Name" = "PlanA-Public-Subnet"
}
private_subnet_tags = {
    "Name" = "PlanA-Private-Subnet"
}
}