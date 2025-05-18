output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.mongo_vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.mongo_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.mongo_vpc.private_subnet_ids
}

