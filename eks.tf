module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.0.0"

  cluster_name = local.name
  cluster_endpoint_public_access = true

  vpc_id = module.vpc.vpc_id
subnet_ids = module.vpc.private_subnets
tags = {

    Environment = local.env
    terraform = "true"
}


}