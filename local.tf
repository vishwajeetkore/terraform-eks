locals {
   region = "ap-south-1"
   name = "guru-eks-cluster"
   vpc_cidr = "10.0.0.0/16"
   azs = ["ap-south-1a", "ap-south-1b"]
   private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
   public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
   intra_subnets = ["10.0.5.0/24", "10.0.6.0/24"]
   env = "dev"

}