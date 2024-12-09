variable "role_name" {
  description = "The name of the IAM role for the EKS cluster."
  type        = string
  default     = "eks-cluster-role"
}

# Variable for the ECR Access IAM Role Name
variable "ecr_role_name" {
  description = "The name of the IAM role for ECR access."
  type        = string
  default     = "eks-ecr-access-role"
}

# Optional: Variable to specify the ECR policy to attach (default to read-only)
variable "ecr_policy" {
  description = "The IAM policy to attach to the ECR access role."
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}