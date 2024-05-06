provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_access_key"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    s3 = "http://s3.localhost.localstack.cloud:4566"
  }

}

# recurso bucket s3
resource "aws_s3_bucket" "bucket1" {
  bucket = "bucket1"
  website {
    index_document = "index.html"
  }
}

# recurso objeto do bucket s3
resource "aws_s3_bucket_object" "html_file" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "index.html"
  source = "index.html"
  acl  = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = aws_s3_bucket.bucket1.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = "*"
                Action = "s3:GetObject"
                Resource = "${aws_s3_bucket.bucket1.arn}/*"
            }
        ]
    })
}