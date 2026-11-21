output "bucket_name" {
  value       = aws_s3_bucket.state.id
  description = "Remote state S3 bucket name"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.locks.id
  description = "DynamoDB distributed lock table name"
}
