variable "environment" {
  type        = string
  description = "Target deployment environment"
}

variable "vpc_id" {
  type        = string
  description = "Target VPC ID"
}

variable "database_subnet_ids" {
  type        = list(string)
  description = "Isolated subnets for RDS placement"
}

variable "allowed_security_group_ids" {
  type        = list(string)
  description = "Security groups permitted to communicate with RDS"
  default     = []
}

variable "instance_class" {
  type        = string
  default     = "db.t4g.medium"
  description = "Database instance compute class"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "Initial storage allocation in GB"
}

variable "max_allocated_storage" {
  type        = number
  default     = 100
  description = "Storage autoscaling ceiling in GB"
}

variable "multi_az" {
  type        = bool
  default     = false
  description = "Enable Multi-AZ high availability failover"
}

variable "backup_retention_period" {
  type        = number
  default     = 7
  description = "Backup retention period in days"
}

variable "kms_key_arn" {
  type        = string
  default     = null
  description = "KMS Customer Managed Key for encryption at rest"
}
