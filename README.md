# Terraform Helm InfluxDB v2 Module
A Terraform module to deploy [InfluxDB v2](https://github.com/influxdata/influxdb) on a Kubernetes Cluster using the [Helm Provider](https://registry.terraform.io/providers/hashicorp/helm).

![Concept Flow Illustration](https://user-images.githubusercontent.com/12916656/167049505-1a2c7aa6-d605-49d8-b295-83a69e2c8973.svg)

## Default Admin Password & Token

If the `admin_password` or `admin-token` input variables are **not** set, the initial password & token for the `admin` user account are auto-generated and stored as clear text in the `admin-password` and `admin-token` fields of a secret named `influxdb2-auth`[^1] in your InfluxDB installation namespace (`influxdb` by default). You can retrieve these values via the `kubectl` command:

```
kubectl -n influxdb get secret influxdb2-auth -o jsonpath="{.data.admin-password}" | base64 -d; echo
```

Substitute `admin-password` in the above command with `admin-token` to retrieve the default Admin user token.

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


[^1]: [InfluxDB v2 Helm Chart - Fixed Auth Credentials](https://artifacthub.io/packages/helm/influxdata/influxdb2#fixed-auth-credentials)