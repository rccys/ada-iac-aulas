# exercicio aula 2 criação de máquina virtual
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_access_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
  endpoints {
    #s3 = "http://s3.localhost.localstack.cloud:4566"
    ec2 = "http://localhost:4566"
  }
}

resource "aws_instance" "exercicio_aula2" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    name = "exercicio_aula2"
  }
}

