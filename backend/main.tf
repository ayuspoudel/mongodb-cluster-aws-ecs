

module "s3_backend" {
  source = "git::https://github.com/ayuspoudel/cloud-iac-monorepo.git//modules/s3?ref=master"
  project = "terraform-backend"
  owner   = "mongodb-HA"
  force_destroy = true
}


module "dynamodb_backend"{
    source = "git::https://github.com/ayuspoudel/cloud-iac-monorepo.git//modules/dynamodb?ref=master"
    project = "mongodb-HA"
    owner = "ayush"
}