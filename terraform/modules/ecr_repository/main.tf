# modules/ecr_repository/main.tf

resource "aws_ecr_repository" "my_repository" {
  name = var.repository_name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}
