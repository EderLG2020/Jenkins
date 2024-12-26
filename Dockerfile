# Usa la imagen oficial de Jenkins LTS como base
FROM jenkins/jenkins:lts

# Instalar dependencias necesarias para NVM, Node.js y Docker
USER root
RUN apt-get update && \
    apt-get install -y curl bash git docker.io && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    echo "source ~/.nvm/nvm.sh" >> ~/.bashrc && \
    echo "nvm install 16" >> ~/.bashrc && \
    echo "nvm use 16" >> ~/.bashrc && \
    echo "npm install -g n" >> ~/.bashrc

# Cambiar a usuario jenkins
USER jenkins

# Expone los puertos de Jenkins (si no están expuestos por defecto)
EXPOSE 8080
EXPOSE 50000
