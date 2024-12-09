resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [var.iam_policy_attachment]
}
