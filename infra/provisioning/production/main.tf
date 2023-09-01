module "production" {
    source = "../modules"

    aws_region = "us-east-1"
    aws_profile = "default-production"

    repository_name = "apps-production"
}
