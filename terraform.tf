terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"   # make sure it's 5.x
    }
  }

  required_version = ">= 1.5.0"
}