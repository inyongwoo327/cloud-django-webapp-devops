output "vpc_id" {
    value = aws_vpc.main.id
}

output "subnet_ids" {
    value = aws_subnet.public[*].id
}

output "security_group_id" {
    value = aws_security_group.eks.id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}