output "cluster_name" {
  value = aws_eks_cluster.trainbook.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.trainbook.endpoint
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "node_group_name" {
  value = aws_eks_node_group.trainbook_nodes.node_group_name
}