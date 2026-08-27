module "network" {
  source = "./modules/network"

  name     = "demo-network"
  region   = "us-east-1"
  cidr     = "10.0.0.0/16"
  az_count = 2
}

module "ecr" {
  source = "./modules/ecr"

  name                 = "dd279a8f-0c56-4e6a-99d3-590889c180b1"
  image_tag_mutability = "MUTABLE"
  scan_on_push         = true
  force_delete         = false
}


module "vm" {
  source = "./modules/vm"

  # --- Networking: ALWAYS a literal reference to module.network's outputs.
  # Never a Handlebars placeholder, never sourced from the VM DB config —
  # same rule as vpc_id in eks.hbs.
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_ids[0]

  # --- VM config: sourced from the VmDeployment DB config
  name              = "hafoza"
  region            = "us-east-1"
  instance_type     = "t3.micro"
  kind_cluster_name = "kind"
  container_port    = 3000
  host_port         = 80

  depends_on = [module.network]
}