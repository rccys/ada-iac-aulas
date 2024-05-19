output "bucket_name" {
  value       = aws_s3_bucket.bucket.bucket
  description = "O nome do bucket criado"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_domain_name
  description = "O domínio do bucket criado"
}