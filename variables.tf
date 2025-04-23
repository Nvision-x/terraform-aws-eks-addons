variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "namespace" {
  description = "Namespace where resources will be created"
  type        = string
  default     = "kube-system"
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "oidc_provider_arn" {
  description = "OIDC provider ARN from EKS module"
  type        = string
}

variable "autoscaler_role_name" {
  description = "Name of IAM role for cluster autoscaler"
  type        = string
}

variable "autoscaler_service_account" {
  description = "Service account name for cluster autoscaler"
  type        = string
}

variable "lb_controller_role_name" {
  description = "Name of IAM role for load balancer controller"
  type        = string
}

variable "lb_controller_service_account" {
  description = "Service account name for load balancer controller"
  type        = string
}



