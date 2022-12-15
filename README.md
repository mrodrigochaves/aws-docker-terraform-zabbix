### Implementação de servidor Zabbix de forma 100% automatizada na AWS usando Terraform e Docker Compose.

Projeto de provisionamento de servidor Zabbix utilizando containeres Docker de forma 100% automatizada. Para tal utilizei o Terraform para provisionar uma instância Ubuntu na Aws, o Docker Compose para orquestrar os containeres Docker, e Shell Scripts para instalar pacotes e ferramentas bem como automatizar os demais processos.

# 💻 Stacks utilizadas:
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)  ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)  ![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white) ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Zabbix](https://img.shields.io/badge/zabbix-d0021b?style=for-the-badge&logo=zabbix&logoColor=white) ![Grafana](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white)

### Provisionando instância na AWS

Instale o Terraform  no Cloud Shell com os comandos abaixo.

    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
	sudo yum -y install terraform
    
Execute o Terraform.

    terraform init
	terraform plan
	terraform apply

       


###Continua
                    
