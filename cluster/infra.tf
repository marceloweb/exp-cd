resource "digitalocean_kubernetes_cluster" "mylab" {
  name   = "mylab"
  region = "sfo3"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.24.4-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 3

    taint {
      key    = "workloadKind"
      value  = "apps"
      effect = "NoSchedule"
    }
  }
}
