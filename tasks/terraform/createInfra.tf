provider "aws" { 
  region = "us-east-1"
  access_key = "AKIAWRSPHXQ3KPLKJXMJ"
  secret_key = "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"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "s3-graphql-bucket"
  acl = "private"
  
  versioning {
    enabled = true
  }

  tags {
    Name = "tag-s3-graphql-bucket"
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