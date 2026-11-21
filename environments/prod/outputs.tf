output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "Production VPC ID"
}

output "eks_cluster_name" {
  value       = module.eks.cluster_name
  description = "Production EKS Cluster Name"
}

output "rds_endpoint" {
  value       = module.rds.endpoint
  description = "Production RDS Endpoint"
}
