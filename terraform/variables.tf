variable "aws_region" {
  description = "AWS region for TF deployment"
  default     = "eu-west-1"
}

variable "dns_zone" {
  description = "DNS zone for CRC"
  default     = "Z09075302CWQPQ2R28AZH"
}

#variable "ip_gcp_lb_fe" {
#  description = "IP for GCP LB Frontend"
#  default = module.lb-http.google_compute_global_address.default  
#}

variable "gcp_region" {
  description = "GCP zone for TF deployment"
  default     = "us-central1"
}

variable "gcp_project_id" {
  description = "Project ID on GCP"
  default     = "cloud-resume-2021-335819"
}

variable "gcp_lb_name" {
  description = "GCP load balancer name"
  default     = "lb-resume-challenge2"
}

variable "service_port" {
  description = "Service port for backend"
  default     = "80"
}

variable "service_port_name" {
  description = "Service name port for backend"
  default     = "http"
}

variable "backend" {
  description = "Backend group name"
  default     = "staticresume"
}

variable "container_image" {
  description = "Container image URL"
  default     = "us-central1-docker.pkg.dev/cloud-resume-2021-335819/cloud-resume/static-light@sha256:803fa6888db5645998627bb17a605df24f8aad8d0c19a81dbf5fa69de14dcfb8"
}

variable "ssl" {
  description = "Run load balancer on HTTPS and provision managed certificate with provided `domain`."
  type        = bool
  default     = true
}

variable "domain" {
  description = "Domain name to run the load balancer on. Used if `ssl` is `true`."
  type        = string
  default     = "web-resume2.sanavia.xyz"
}

variable "lb-name" {
  description = "Name for load balancer and associated resources"
  default     = "run-lb"
}

variable "exposed_port" {
  description = "Port exposed on dockerfile"
  default     = "3000"
}