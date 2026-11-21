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

  default_tags {
    tags = {
      Environment = "prod"
      Compliance  = "CIS-Benchmark-v1.4"
      Owner       = "dspkla"
      ManagedBy   = "Terraform"
    }
  }
}

module "vpc" {
  source               = "../../modules/vpc"
  environment          = "prod"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  availability_zones   = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
}

module "eks" {
  source           = "../../modules/eks"
  environment      = "prod"
  subnet_ids       = module.vpc.private_subnet_ids
  desired_capacity = 3
  min_capacity     = 3
  max_capacity     = 6
  instance_types   = ["m6i.xlarge", "m5.xlarge"]
}

module "rds" {
  source              = "../../modules/rds"
  environment         = "prod"
  vpc_id              = module.vpc.vpc_id
  database_subnet_ids = module.vpc.private_subnet_ids
  instance_class      = "db.r6g.xlarge"
  allocated_storage   = 100
  multi_az            = true
}
