data_dir = "/tmp/consul"
retry_join = ["consul-1", "consul-2", "consul-3"]

enable_central_service_config = true

ports {
    grpc = 8502
}