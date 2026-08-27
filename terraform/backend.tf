terraform {
  backend "s3" {
    bucket         = "infra-automation-app"
    key            = "e756f677-3a15-4b86-95ae-915c38e8b2bc/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
