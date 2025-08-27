terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

# Simulate creating "infrastructure"
locals {
  target_hosts = ["127.0.0.1"]
  config_data = {
    app_name = "spacelift-demo"
    version  = "1.0.2"
    environment = "development"
  }
}

# Create a timestamp to show when "infrastructure" was provisioned
resource "time_static" "deployment_time" {}

# Create a local file to simulate infrastructure provisioning
resource "local_file" "infrastructure_info" {
  content = jsonencode({
    hosts = local.target_hosts
    config = local.config_data
    provisioned_at = time_static.deployment_time.rfc3339
  })
  filename = "/tmp/spacelift-infrastructure.json"
}

# Simulate a delay (like cloud resource provisioning)
resource "time_sleep" "simulate_provisioning" {
  create_duration = "10s"
  depends_on = [local_file.infrastructure_info]
}