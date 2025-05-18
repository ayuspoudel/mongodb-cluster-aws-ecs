module "demo_instance" {
  source = "git::https://github.com/ayuspoudel/cloud-iac-monorepo.git//modules/ec2?ref=master"

  name         = "demo"
  launch_type  = "instance"
  ami          = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = "t3.micro"

  # Automatically uses default VPC + subnet + SG
  subnet_id           = null
  security_group_ids  = []
  associate_public_ip = true

  create_key_pair        = true
  key_name               = "demo-key"
  iam_instance_profile   = null

  monitoring = true

  root_volume = {
    size = 20
    type = "gp3"
  }

  enable_data_volume = false

  tags = {
    Owner       = "you"
    Environment = "dev"
  }
}