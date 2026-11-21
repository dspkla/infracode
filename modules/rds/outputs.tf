output "endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "Database connection endpoint"
}

output "database_name" {
  value       = aws_db_instance.main.db_name
  description = "Primary database name"
}

output "security_group_id" {
  value       = aws_security_group.rds.id
  description = "Security group ID attached to RDS"
}
