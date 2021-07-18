#main tf - default file for configuration
 
#aws ami (An Amazon Machine Image (AMI) provides the information required to launch an instance. You must specify an AMI when you launch an instance)

# and data blocks for grabbing data from the environment


resource "aws_security_group" "allow_8080" {
  name        = "allow_8080"
  description = "Allow 8080 inbound traffic"
#   vpc_id      = aws_vpc.main.id

  ingress {
    description      = "8080 from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] //alllows any IP address
  }

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# resources blocks for deploying resources 

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type =  var.size   //"t3.micro"

  vpc_security_group_ids = [ aws_security_group.allow_8080.id]

# User data to provide when launching the instance
  user_data =  <<-EOF
                #!/bin/bash
                echo "I made a terraform module!" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF

  tags = {
    Name = var.servername // "HelloWorld"
  }
}