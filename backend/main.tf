

module "s3_backend" {
  source = "https://github.com/ayuspoudel/cloud-iac-monorepo.git/modules/s3"
  project = "terraform-backend"
  owner   = "mongodb-HA"
  force_destroy = true
}


module "dynamodb_backend"{
    source = "https://github.com/ayuspoudel/cloud-iac-monorepo.git/modules/dynamodb"
    project = "mongodb-HA"
    owner = "ayush"
}