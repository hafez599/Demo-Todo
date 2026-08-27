provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Service     = "dd279a8f-0c56-4e6a-99d3-590889c180b1"
      Environment = "dev"
      ManagedBy   = "autodeployers"
    }
  }
}
