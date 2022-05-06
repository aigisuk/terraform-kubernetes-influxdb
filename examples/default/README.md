# Default Deployment Example

This example illustrates how to use the `terraform-kubernetes-influxdb` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| release_name | Helm release name | string | `influxdb2` | no |
| namespace | Namespace to install InfluxDB chart into (created if non-existent on target cluster) | string | `influxdb` | no |
| influxdb_chart_version | Version of InfluxDB chart to install | string | `2.0.12` | no |
| timeout_seconds | Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout (secs) | number | `800` | no |
| admin_password | Default Admin password (minimum 8 chars) | string | empty | no |
| admin_token | Default Admin token | string | empty | no |
| enable_persistence | Persist data to a persistent volume? | bool | `false` | no |
| pv_size | Size persistent volume to provision | bool | `false` | no |
| values_file | Name of the InfluxDB helm chart values file to use | string | `values.yaml` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
