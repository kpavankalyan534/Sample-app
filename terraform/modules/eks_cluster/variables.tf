variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "role_arn" {
  description = "The IAM role ARN that EKS will assume."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "iam_policy_attachment" {
  description = "The IAM policy attachment for EKS cluster."
  type        = any
}
