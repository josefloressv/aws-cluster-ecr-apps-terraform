terraform {
    required_version = ">= 1.1.9"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">= 4.10.0"
        }
    }

    backend "s3" {}
}

resource "aws_ecr_repository" "ecr-app" {
  name                 = var.ecr_repo_name
  image_tag_mutability = var.ecr_repo_tag_mutability
  tags = merge(
      local.tags,
      var.ecr_repo_tags
  )
}

resource "aws_ecr_lifecycle_policy" "ecr-app-policy" {
  repository = aws_ecr_repository.ecr-app.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "${var.ecr_repo_policy_description}",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": ${var.ecr_repo_policy_expiration_days}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
