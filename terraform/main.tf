terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.52.0"
    }
  }

}

provider "aws" {
  region = var.location

  default_tags {
    tags = local.common_tags
  }
}

module "vpc" {
  source                 = "./VPC"
  cidr_block_vpc         = var.cidr_block_vpc
  cidr_block_route_table = var.cidr_block_route_table
}

module "subnets" {
  source              = "./subnets"
  vpc_id              = module.vpc.vpc_id
  route_table_id      = module.vpc.route_table_id
  cidr_block_subnet_1 = var.cidr_block_subnet_1
  cidr_block_subnet_2 = var.cidr_block_subnet_2
  availability_zone_a = var.availability_zone_a
  availability_zone_c = var.availability_zone_c
}

module "ec2" {
  source            = "./ec2"
  subnet_1_id       = module.subnets.subnet_1_id
  subnet_2_id       = module.subnets.subnet_2_id
  security_group_id = module.vpc.security_group_id
}

module "loudBalance" {
  source             = "./loudBalance"
  security_group_id  = module.vpc.security_group_id
  subnets            = [module.subnets.subnet_1_id, module.subnets.subnet_2_id]
  vpc_id             = module.vpc.vpc_id
  LoudBalanceApp1_id = module.ec2.instance_id_1
  LoudBalanceApp2_id = module.ec2.instance_id_2
}
