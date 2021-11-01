module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t2.micro"
  key_name               = module.key_pair.key_pair_key_name
  monitoring             = true
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  subnet_id              = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}