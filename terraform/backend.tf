terraform {
  backend "s3" {
    bucket         = "infra-automation-app"
    key            = "dd279a8f-0c56-4e6a-99d3-590889c180b1/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
