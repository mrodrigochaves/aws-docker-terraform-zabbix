### Implementação de servidor Zabbix de forma 100% automatizada na AWS usando Terraform e Docker Compose.

Projeto de provisionamento de servidor Zabbix utilizando containeres Docker de forma 100% automatizada. Para tal utilizei o Terraform para provisionar uma instância Ubuntu na Aws, o Docker Compose para orquestrar os containeres Docker, e Shell Scripts para instalar pacotes e ferramentas bem como automatizar os demais processos.

# 💻 Stacks utilizadas:
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)  ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)  ![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white) ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Zabbix](https://img.shields.io/badge/zabbix-d0021b?style=for-the-badge&logo=zabbix&logoColor=white) ![Grafana](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white) ![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white)

### Provisionando instância na AWS

Instale o Terraform no Cloud Shell ou AWS CLI com os seguintes passos:

Click no link para instalar o [AWS CLI](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html)

>>Execute no Cloud Shell AWS:
    
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform

>>Baixando arquivos Terraform

    curl https://mr-aws-zabbix.s3.amazonaws.com/terraform.zip -O -J -L
    unzip terraform.zip
    cd terraform


>>Executando Terraform
    
    terraform init
    terraform plan -out tfplan 
    terraform apply "tfplan"

## Instalando Docker, Docker Compose e executando
### Acesse o Ubuntu via ssh
>> Lembre-se de substituir as informações da chave .pem e ip de acordo com sua instância

    sudo chmod 400 ec2.pem
    ssh -i ec2.pem ubuntu@<ec2-ip>
    sudo su
    apt update

### Baixando o arquivo Docker

    cd /tmp
    curl https://mr-aws-zabbix.s3.amazonaws.com/docker-install.zip -O -J -L
    apt install unzip
    unzip docker-install.zip

### Instale e execute o Docker

    chmod +x docker-install.sh
    sed -i -e 's/\r$//' docker-install.sh
    ./docker-install.sh
    




### Referências

* [AWS](https://aws.amazon.com/pt/docker/)
* [Zabbix](https://www.zabbix.com/documentation/current/en/manual/installation/containers)
* [Digital Ocean](https://www.digitalocean.com/community/tutorials)
* [CarryOn Tech](https://github.com/carryontech/zabbix-docker-compose)