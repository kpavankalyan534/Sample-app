resource "aws_iam_role" "eks_cluster_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# IAM Role for ECR Access (for EKS nodes to pull/push to ECR)
resource "aws_iam_role" "ecr_access_role" {
  name = var.ecr_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

# Attach ECR policy to ECR Access Role
resource "aws_iam_role_policy_attachment" "ecr_access_policy" {
  role       = aws_iam_role.ecr_access_role.name
  policy_arn = var.ecr_policy
}