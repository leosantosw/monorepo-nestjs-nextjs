resource "aws_ecr_repository" "ecr_repository" {
  name = var.repository_name
}

resource "null_resource" "deploy_ecr" {
  provisioner "local-exec" {
    command = "sh ../scripts/deploy_ecr.sh ${var.repository_name} ${var.aws_region} ${var.aws_profile}"
  }

  depends_on = [aws_ecr_repository.ecr_repository]
}
