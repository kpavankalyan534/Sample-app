# modules/ecr_repository/main.tf

resource "aws_ecr_repository" "my_repository" {
  name = var.repository_name
lifecycle {
    create_before_destroy = true  # Ensures resources are created before destroying
    prevent_destroy = true       # Prevents the repository from being deleted unintentionally
  }
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}
