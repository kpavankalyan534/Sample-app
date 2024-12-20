# modules/ecr_repository/variables.tf

variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to the repository"
  type        = map(string)
  default     = {}
}
