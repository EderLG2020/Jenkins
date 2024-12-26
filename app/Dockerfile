# Usa la imagen oficial de Jenkins LTS como base
FROM jenkins/jenkins:lts

# Cambiar a usuario root para instalar dependencias
USER root

# Instalar dependencias necesarias para NVM, Node.js y Docker
RUN apt-get update && \
    apt-get install -y curl bash git docker.io && \
    # Instalar NVM (Node Version Manager)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    # Instalación de Node.js usando NVM
    bash -c "source ~/.nvm/nvm.sh && nvm install 16 && nvm use 16 && npm install -g n" && \
    # Limpiar caché para reducir el tamaño de la imagen
    apt-get clean

# Cambiar a usuario jenkins para evitar trabajar como root
USER jenkins

# Expone los puertos de Jenkins (si no están expuestos por defecto)
EXPOSE 8080
EXPOSE 50000

# Establecer directorio de trabajo (opcional, si se necesita)
# WORKDIR /var/jenkins_home

# Iniciar Jenkins (por defecto, Jenkins se inicia cuando el contenedor corre)
