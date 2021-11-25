packer {
  required_plugins {
    amazon = {
      version = " >= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
data "amazon-parameterstore" "GitHubRepository" {  
  name = "github_repository"  
  with_decryption = false
}

data "amazon-parameterstore" "RepositoryToken" {  
    name = "repository_token"  
    with_decryption = true
}

data "amazon-parameterstore" "GitHubUser" {  
    name = "github_user"  
    with_decryption = false
}

source "amazon-ebs" "gh-runner" {
  ami_name      = "gh-runner-ami"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.0.20211001.1-x86_64-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username = "ec2-user"
  user_data_file = "/Users/csel01/Downloads/gh-runner-key.pem"
  communicator  = "ssh"
}

build {
  name    = "gh-runner-build"
  sources = [
    "source.amazon-ebs.gh-runner"
  ]
  provisioner "shell" {
    script = "runner-agent.sh"
  }
}
