module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.28"
  subnet_ids      = aws_subnet.public[*].id
  vpc_id          = aws_vpc.main.id

  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = var.key_name
    }
  }

  tags = {
    Name = "eks-cluster"
  }
}