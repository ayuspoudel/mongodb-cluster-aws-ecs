module "mongo_vpc" {
  source = "git::https://github.com/ayuspoudel/cloud-iac-monorepo.git//modules/vpc?ref=master"

  project_name         = "mongodb-ha"
  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["us-east-1a"]

  public_subnet_cidrs  = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24"]

  enable_nat_gateway     = false
  nat_gateway_per_az     = false
  enable_vpn_gateway     = false
  enable_transit_gateway = false

  tags = merge(local.common_tags, {
    Name    = "mongodb-ha"
    Project = "MongoDB High Availability Cluster"
    Module  = "vpc"
    Purpose = "Database Subnet Isolation for MongoDB HA Nodes"
  })
}

module "mongo_ha_sg" {
  source = "git::https://github.com/ayuspoudel/cloud-iac-monorepo.git//modules/security-group?ref=master"

  enabled               = true
  create_security_group = true
  name                  = "mongo-ha"
  description           = "Security group for MongoDB HA cluster"
  vpc_id                = module.mongo_vpc.vpc_id

  tags = merge(local.common_tags, {
    Name    = "mongo-ha"
    Purpose = "MongoDB HA Cluster SG"
    Module  = "security-group"
  })

  ingress_rules = [
    {
      rule_key    = "mongo"
      description = "Allow MongoDB Primary"
    },
    {
      rule_key    = "mongo-secondary"
      description = "Allow MongoDB Secondary"
    }
  ]

  egress_rules = [
    {
      rule_key    = "all-allow"
      description = "Allow all outbound traffic"
    }
  ]
}

module "demo_instance" {
  source = "git::https://github.com/ayuspoudel/cloud-iac-monorepo.git//modules/ec2?ref=master"

  name                 = "demo"
  launch_type          = "instance"
  ami                  = "ami-0c02fb55956c7d316"
  instance_type        = "t3.micro"

  subnet_id            = module.mongo_vpc.public_subnets[0]
  security_group_ids   = [module.mongo_ha_sg.security_group_id]

  associate_public_ip  = true
  create_key_pair      = true
  key_name             = "mongo-ha-key"
  iam_instance_profile = null
  monitoring           = true

  root_volume = {
    size = 20
    type = "gp3"
  }

  enable_data_volume = false

  tags = merge(local.common_tags, {
    Name    = "mongo-demo-instance"
    Module  = "ec2"
    Purpose = "MongoDB HA demo node"
  })
}
