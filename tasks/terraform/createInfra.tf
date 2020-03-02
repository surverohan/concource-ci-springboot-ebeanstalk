provider "aws" { 
  region = "us-east-1"
  access_key = "AKIAXFOHUY6OON6BTQP4"
  secret_key = "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"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "s3-graphql-bucket"
  acl = "private"
  
  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true
	prefix = "test-scripts"

    transition {
      days = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days = 60
      storage_class = "GLACIER"
    }
  }
}