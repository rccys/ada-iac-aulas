resource "aws_s3_bucket" "bucket_aula3" {
  bucket = var.bucket_name

  tags = {
    Nome = "Meu Bucket Terraform"
  }
}