module "default_network" {
  source = "git@github.com:srhoton/tf-module-network.git"
  env_name = "prod"
  base_cidr_block = "192.168.0.0/16"
  enable_nat_gateway = false
}
