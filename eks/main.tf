variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

terraform {
  cloud {
    organization = "brbernardo"

    workspaces {
      name = "eks"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "brbernardo-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
