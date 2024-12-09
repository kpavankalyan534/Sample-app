provider "aws" {
  region = "us-west-2"  # Set the region for all resources
}
module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = "10.0.0.0/16"
  subnet_count = 2
}

module "iam" {
  source     = "./modules/iam"
  role_name  = "eks-cluster-role"
}

module "eks_cluster" {
  source        = "./modules/eks_cluster"
  cluster_name  = "my-cluster"
  role_arn      = module.iam.role_arn
  subnet_ids    = module.vpc.subnet_ids
  iam_policy_attachment = module.iam.eks_cluster_policy
}

# ECR Repository Module
module "ecr_repository" {
  source         = "./modules/ecr_repository"
  repository_name = "my-python-app"  # The name of the ECR repository
  tags = {
    "Environment" = "production"
  }
}

# Output for ECR Repository URL
output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = module.ecr_repository.repository_url
}
output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "cluster_name" {
  value = module.eks_cluster.cluster_name
}

