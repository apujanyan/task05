output "traffic_manager_fqdn" {
  description = "The fully qualified domain name (FQDN) of the Azure Traffic Manager profile."
  value       = module.traffic_manager.this.dns_config[0].fqdn
}