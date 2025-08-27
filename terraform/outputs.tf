# Output that will be passed to Ansible stack
output "target_hosts" {
  description = "List of hosts for Ansible to configure"
  value = local.target_hosts
}

output "app_config" {
  description = "Application configuration"
  value = local.config_data
}

output "deployment_timestamp" {
  description = "When the infrastructure was provisioned"
  value = time_static.deployment_time.rfc3339
}