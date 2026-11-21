variable "environment" {
  type        = string
  description = "Target environment"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the cluster and worker nodes"
}

variable "cluster_version" {
  type        = string
  default     = "1.30"
  description = "Kubernetes control plane version"
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "Worker node instance types"
}

variable "desired_capacity" {
  type        = number
  default     = 2
}

variable "min_capacity" {
  type        = number
  default     = 1
}

variable "max_capacity" {
  type        = number
  default     = 4
}
