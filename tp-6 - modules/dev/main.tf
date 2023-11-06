provider "aws" {
  region     = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-abdelhad"
    key    = "abdelhad-dev.tfstate"
    region     = "us-east-1"
  }
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.nano"
  aws_common_tag = {
    Name = "ec2-dev-abdelhad"
  }
  sg_name = "dev-abdelhad-sg"
}
