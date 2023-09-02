#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <repository_name> <aws_region> <aws_profile> <dockerfile_directory>"
  exit 1
fi

repository_name="$1"
aws_region="$2"
aws_profile="$3"
dockerfile_directory="../../../"

cd "$dockerfile_directory"

docker build --no-cache --file Dockerfile -t "${repository_name}" .

aws ecr get-login-password --region "${aws_region}" --profile "${aws_profile}" | docker login --username AWS --password-stdin "$(aws ecr describe-repositories --repository-names "${repository_name}" --region "${aws_region}" --profile "${aws_profile}" --query 'repositories[0].repositoryUri' --output text)"

docker tag "${repository_name}:latest" "$(aws ecr describe-repositories --repository-names "${repository_name}" --region "${aws_region}" --profile "${aws_profile}" --query 'repositories[0].repositoryUri' --output text):latest"

docker push "$(aws ecr describe-repositories --repository-names "${repository_name}" --region "${aws_region}" --profile "${aws_profile}" --query 'repositories[0].repositoryUri' --output text):latest"
