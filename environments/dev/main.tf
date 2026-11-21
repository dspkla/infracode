terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "../../modules/vpc"
  environment          = "dev"
  vpc_cidr             = "10.10.0.0/16"
  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.10.0/24", "10.10.20.0/24"]
  availability_zones   = ["${var.aws_region}a", "${var.aws_region}b"]
}

module "eks" {
  source           = "../../modules/eks"
  environment      = "dev"
  subnet_ids       = module.vpc.private_subnet_ids
  desired_capacity = 2
  min_capacity     = 1
  max_capacity     = 3
  instance_types   = ["t3.medium"]
}
