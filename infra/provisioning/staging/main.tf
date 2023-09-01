module "staging" {
    source = "../modules"
    
    aws_region = "us-east-1"
    aws_profile = "default-staging"

    repository_name = "apps-staging"
}
