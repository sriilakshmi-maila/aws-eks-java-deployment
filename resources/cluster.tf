# EKS Cluster
resource "aws_eks_cluster" "trainbook" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id
    ]

    endpoint_public_access  = true
    endpoint_private_access = true
    public_access_cidrs     = ["205.254.169.84/32"]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = {
    Name = var.cluster_name
  }
}

# EKS Managed Node Group
resource "aws_eks_node_group" "trainbook_nodes" {
  cluster_name    = aws_eks_cluster.trainbook.name
  node_group_name = "trainbook-worker-nodes"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  instance_types = [var.node_instance_type]

  scaling_config {
    desired_size = var.desired_nodes
    min_size     = 1
    max_size     = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.worker_ecr_policy,
    aws_iam_role_policy_attachment.worker_cni_policy
  ]

  tags = {
    Name = "trainbook-worker-nodes"
  }
}