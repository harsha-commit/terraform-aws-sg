locals {
  common_tags = {
    Name        = var.project_name
    Environment = var.environment
    Terraform   = true
  }
}
