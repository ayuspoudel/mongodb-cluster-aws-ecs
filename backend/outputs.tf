output "backend_bucket_name" {
  description = "The name of the S3 bucket used for storing Terraform state files."
  value       = module.s3_backend.bucket_name
}

output "backend_bucket_id" {
  description = "The AWS ID (ARN) of the Terraform backend S3 bucket."
  value       = module.s3_backend.bucket_id
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking."
  value       = module.dynamodb_backend.table_name
}

output "dynamodb_table_id" {
  description = "The AWS ID (ARN) of the DynamoDB lock table."
  value       = module.dynamodb_backend.table_id
}

output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.simple_vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.simple_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.simple_vpc.private_subnet_ids
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs (if any)"
  value       = var.enable_nat_gateway ? module.simple_vpc.nat_gateway_ids : []
}
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs (if any)"
  value       = module.simple_vpc.nat_gateway_ids
  # same as above, conditionally output if NAT gateways are enabled
}

output "route_table_ids" {
  description = "List of Route Table IDs"
  value       = module.simple_vpc.route_table_ids
}
