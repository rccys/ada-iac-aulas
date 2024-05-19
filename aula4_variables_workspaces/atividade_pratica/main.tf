resource "aws_instance" "atividade_pratica" {
  ami           = var.image_id
  instance_type = var.instance_type

  tags = {
    Name = "atividade_pratica_${terraform.workspace}"
  }
}
