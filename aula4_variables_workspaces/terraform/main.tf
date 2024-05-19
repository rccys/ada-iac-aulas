resource "aws_s3_bucket" "bucket" {
  # nome do bucket no workspace
  bucket = "${var.project_name}-${terraform.workspace}-${random_id.bucket_suffix.hex}"

  tags = {
    Environment = terraform.workspace
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 2
}