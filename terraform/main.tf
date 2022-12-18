# Provisionando VPC
resource "aws_vpc" "zabbix-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "zabbix-vpc"
  }
}

# Provisionando Subnet Pública
resource "aws_subnet" "zabbix-public-subnet" {
  vpc_id     = aws_vpc.zabbix-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "zabbix-public-subnet"
  }
}

# Provisionando Internet Gateway
resource "aws_internet_gateway" "zabbix-igw" {
  vpc_id = aws_vpc.zabbix-vpc.id

  tags = {
    Name = "zabbix-igw"
  }
}

# Provisionando Tabela de Roteamento
resource "aws_route_table" "zabbix_rt" {
  vpc_id = aws_vpc.zabbix-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zabbix-igw.id
  }

  tags = {
    Name = "zabbix_rt"
  }
}

# Provisionando Rota Default para Acesso à Internet
resource "aws_route" "zabbix-rt-net" {
  route_table_id            = aws_route_table.zabbix_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.zabbix-igw.id
}

# Associando a Subnet Pública com a Tabela de Roteamento
resource "aws_route_table_association" "zabbix-pub-association" {
  subnet_id      = aws_subnet.zabbix-public-subnet.id
  route_table_id = aws_route_table.zabbix_rt.id
}

variable "key_name" {
    default = "sga-key"
}

locals {
  vpc_id	= "..."
  subnet_id	= "..."
}

resource "aws_instance" "zabbix-sv" {
  ami           = "ami-0a6b2839d44d781b2"
  instance_type = "t2.micro"
  key_name = var.key_name
  subnet_id	= aws_subnet.zabbix-public-subnet.id
  vpc_security_group_ids = ["${aws_security_group.zabbix-server-sg.id}"]
  associate_public_ip_address = true
 
 user_data = <<-EOF
              #!/bin/bash
              echo "Sucesso! Terraform & AWS" > index.html
              nohup busybox httpd -f -p "${var.http_port}" &
              EOF

  tags = {
    Name = "zabbix-sv"
    ambiente = "zabbix"
  }
}

resource "aws_security_group" "zabbix-server-sg" {
  name        = "zabbix-server-sg"
  description = "Allow SSH and HTTP traffic on EC2 instance"
  vpc_id      = aws_vpc.zabbix-vpc.id

  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP to EC2"
    from_port   = 80
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "zabbix-server-sg"
  }
}
variable "http_port" {
  description = "The port the web server will be listening"
  type        = number
  default     = 80
}
output "public_ip" {
  value       = aws_instance.zabbix-sv.public_ip
  description = "The public IP of the web server"
}


