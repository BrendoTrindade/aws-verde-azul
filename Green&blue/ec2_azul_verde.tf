# Defina a configuração do ambiente "azul"
resource "aws_instance" "blue" {
  count = 2
  ami           = "ami-041feb57c611358bd" # Substitua pelo ID da AMI desejada
  instance_type = "t2.micro" # Escolha o tipo de instância apropriado
  key_name      = "AWS-LAB" # Substitua pelo nome da sua chave SSH
  subnet_id     = aws_subnet.private_subnet[count.index].id
  # Outras configurações, como variáveis de usuário, podem ser adicionadas aqui
}

# Defina a configuração do ambiente "verde"
resource "aws_instance" "green" {
  count = 2
  ami           = "ami-041feb57c611358bd" 
  instance_type = "t2.micro" 
  key_name      = "AWS-LAB" 
  subnet_id     = aws_subnet.private_subnet[count.index].id
 
}