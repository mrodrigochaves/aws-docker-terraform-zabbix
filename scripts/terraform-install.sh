#!/bin/bash
### Utilize este script no AWS Cloud Shell
#Instalação do Terrafomr
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#Baixando arquivos Terraform
curl https://mr-aws-zabbix.s3.amazonaws.com/terraform.zip -O -J -L
unzip terraform.zip
cd terraform

#Executando Terraform
terraform init
terraform plan -out tfplan 
terraform apply "tfplan"