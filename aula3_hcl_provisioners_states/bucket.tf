resource "aws_s3_bucket" "bucket_aula3" {
  bucket = var.bucket_name

  tags = {
    Nome = "Meu Bucket Terraform"
  }
}

resource "aws_s3_bucket_policy" "bucket_aula3_policy" {
  bucket = aws_s3_bucket.bucket_aula3.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "${aws_s3_bucket.bucket_aula3.arn}/*"
        ]
      }
    ]
  })
}

