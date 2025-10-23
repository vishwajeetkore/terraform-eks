module "eks" {

  # import the module template
  source  = "terraform-aws-modules/eks/aws"
   version = "~> 21.6"  # latest stable that supports cluster_addons etc.

  #cluster info (control plane)
  cluster_name = local.name
  cluster_endpoint_public_access = true

  vpc_id = module.vpc.vpc_id
subnet_ids = module.vpc.private_subnets


cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent = true
    }
  }

# managing the nodes in cluster
eks_managed_node_group_defaults = {

  instance_types = ["t2.medium"]
  attach_cluster_primary_security_group = true

}

eks_managed_node_groups ={
  tws-cluster-ng = {

      instance_types = ["t2.medium"]
      min_size = 2
      max_size = 3
      desired_size = 2

      capactity_type = "SPOT" 
    
  }
}

tags = {

    Environment = local.env
    terraform = "true"
}


}