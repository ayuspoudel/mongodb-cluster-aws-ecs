module "simple_vpc" {
  source = "git::https://github.com/ayuspoudel/cloud-iac-monorepo.git//modules/vpc?ref=master"

  project_name           = "mongodb-ha"
  vpc_cidr               = "10.0.0.0/16"
  availability_zones     = ["us-east-1a"]

  public_subnet_cidrs    = ["10.0.1.0/24"]
  private_subnet_cidrs   = ["10.0.2.0/24"]

  enable_nat_gateway     = false
  nat_gateway_per_az     = false

  enable_vpn_gateway     = false
  enable_transit_gateway = false

  tags = {
    environment = "dev"
  }
}
