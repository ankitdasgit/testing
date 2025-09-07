module "vpc-module" {
  source              = "./module/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone

}
module "ec2-module" {
  source            = "./module/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc-module.private_subnet_id[0].id
  availability_zone = var.availability_zone
  myVPC             = module.vpc-module.vpc_id

}
 module "alb-module" {
   source            = "./module/alb"
   security_group_id = module.ec2-module.security_group_id
   public_subnet_id  = [module.vpc-module.public_subnet_id[0].id,module.vpc-module.public_subnet_id[1].id]
   vpc_id            = module.vpc-module.vpc_id
   target_group_name = "my-target-group"
   target_group_port = 80
 }

module "rds-module" {
  source = "./module/rds"

  #region                 = var.aws_region
  vpc_id                 = module.vpc-module.vpc_id
  db_instance_identifier = "adarshdb"
  db_name                = "adarshdb"
  db_username            = "admin"
  db_password            = "moodle123"
  db_instance_class      = "db.t3.small"
  db_allocated_storage   = 20
  db_engine_version      = "8.0"
  db_backup_retention    = 7
  db_multi_az            = false
  db_publicly_accessible = true
  # vpc_security_group_ids = [module.ec2-module.security_group_id]
  db_subnet_group_name   = "my-db-subnet-group"
  allowed_cidr_blocks    = ["0.0.0.0/0"]
  subnet_ids             = [module.vpc-module.public_subnet_id[0].id, module.vpc-module.public_subnet_id[1].id]
  environment            = "free-tier"
}