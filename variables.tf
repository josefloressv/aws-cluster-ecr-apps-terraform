# General
variable "base_tags" {
    type = map(string)
    description = "The base tags for the stack"
}

# ECR
variable "ecr_repo_name" {
    type = string
    description = "The name of the ECR repository"
}

variable "ecr_repo_tag_mutability" {
    type = string
    description = "The tag mutability of the ECR repository"
}

variable "ecr_repo_tags" {
    type = map(string)
    description = "The tags to apply to the ECR repository"
}

variable "ecr_repo_policy_expiration_days" {
    type = number
    description = "The expiration date for the ECR repository policy"
}

variable "ecr_repo_policy_description" {
    type = string
    description = "The description for the ECR repository policy"
}