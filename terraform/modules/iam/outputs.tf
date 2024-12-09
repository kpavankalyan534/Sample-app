output "role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "role_name" {
  value = aws_iam_role.eks_cluster_role.name
}

# Output the ECR IAM Role ARN and Name
output "ecr_role_arn" {
  description = "The ARN of the ECR IAM Role."
  value       = aws_iam_role.ecr_access_role.arn
}

output "ecr_role_name" {
  description = "The name of the ECR IAM Role."
  value       = aws_iam_role.ecr_access_role.name
}