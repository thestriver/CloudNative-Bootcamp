terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "3.50.0"  //old 3.7 not compatible with provider
      }
  }
}

provider "aws" {
  region = var.region
}

module "webserver" {
  source = "../../"

  servername = var.servername

  size = "t3.micro"
}


# you then run
# aws configure
# terraform plan
# terraform apply
# then copy the public IP on your aws ec2 dashboard 18.205.192.88 add : 8080 and voila you get "I made a terraform module!"
# close your instance by running 
# terraform destroy
# git filter-branch --tree-filter 'rm -rf path/to/your/file' HEAD to remove the large terraform modules
#git reset --hard HEAD~1; to remove last commit until you get to favorable
#git reset --hard commit c3eaac9 ; to move to that commit specied