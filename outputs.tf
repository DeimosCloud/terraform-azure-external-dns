output "namespace" {
  description = "the kubernetes namespace of the release"
  value       = helm_release.external_dns.namespace
}

output "release_name" {
  description = "the name of the release"
  value       = helm_release.external_dns.name
}
