data_dir = "/tmp/consul"
retry_join = ["consul-1", "consul-2", "consul-3"]

connect {
    enabled = true
}

ports {
    grpc = 8502
}