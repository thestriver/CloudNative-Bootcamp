terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "3.50.0"  //old 3.7 not compatible with provider
      }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "webserver" {
  source = "./modules/ec2"

  servername = "terraformdemo21"

  size = "t3.micro"
}


# you then run
# aws configure
# terraform plan
# terraform apply
# then copy the public IP on your aws ec2 dashboard 18.205.192.88 add : 8080 and voila you get "I made a terraform module!"
# close your instance by running 
# terraform destroy