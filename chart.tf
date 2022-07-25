# Install InfluxDB v2 helm_chart
resource "helm_release" "influxdb2" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://helm.influxdata.com"
  chart            = "influxdb2"
  version          = var.influxdb_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]

  set_sensitive {
    name  = "adminUser.password"
    value = random_password.password.result
  }

  set_sensitive {
    name  = "adminUser.token"
    value = random_string.random.result
  }

  set {
    name  = "persistence.enabled"
    value = var.enable_persistence
  }

  set {
    name  = "persistence.size"
    value = var.pv_size
  }
}
