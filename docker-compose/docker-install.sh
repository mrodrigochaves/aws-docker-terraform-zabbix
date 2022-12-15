# Instalação do Docker
curl -fsSl  https://get.docker.com/| sh

# Verificando versão do Docker
docker version

# Instalação do Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 
# Adicionando permissão de executável ao Docker Compose
chmod +x /usr/local/bin/docker-compose

# Criando atalho para o Docker Compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Verificando versão do Docker Compose
docker-compose version

# Efetuando pull das imagens configuradas
docker-compose up -d