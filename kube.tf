resource "kubernetes_secret" "example" {
  metadata {
    name = "basic-auth"
  }

  data = {
    admin_password = random_password.password.result
    admin_token    = random_string.random.result
  }

  type = "kubernetes.io/basic-auth"
}