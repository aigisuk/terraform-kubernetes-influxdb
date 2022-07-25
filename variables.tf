variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "influxdb2"
}
variable "namespace" {
  description = "Namespace to install InfluxDB chart into"
  type        = string
  default     = "devsecops"
}

variable "influxdb_chart_version" {
  description = "Version of InfluxDB chart to install"
  type        = string
  default     = "2.0.12" # See https://artifacthub.io/packages/helm/influxdata/influxdb2 for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

#admin_password     = random_password.password.result


resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

#admin_token = random_string.random.result


variable "values_file" {
  description = "The name of the InfluxDB helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "enable_persistence" {
  description = "Persist data to a persistent volume?"
  type        = bool
  default     = false
}

variable "pv_size" {
  type        = string
  description = "Size of the persistent volume (if persistence is enabled)"
  default     = "0.5Gi"
}