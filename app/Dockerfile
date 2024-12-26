FROM jenkins/jenkins:lts

# Cambia a usuario root para toda la imagen
USER root

# Elimina el usuario jenkins para trabajar exclusivamente con root
RUN deluser --remove-home jenkins || true

# Instala dependencias necesarias para Docker, nvm, y Node.js
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    build-essential \
    libssl-dev && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io && \
    apt-get clean

# Instala nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Asegura permisos para todos los archivos en .nvm
RUN chmod -R 755 /root/.nvm

# Configura las variables de entorno para nvm y Node.js
ENV NVM_DIR=/root/.nvm
ENV PATH=$NVM_DIR/versions/node/v18.0.0/bin:$NVM_DIR/bin:$PATH

# Instala Node.js y npm con nvm como root
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install 18 && nvm alias default 18"

# Verifica Docker, Node.js y npm como usuario root
RUN docker --version && bash -c "source $NVM_DIR/nvm.sh && node -v && npm -v"

# Configura el usuario predeterminado como root
USER root

# Establece el directorio de trabajo predeterminado como root
WORKDIR /root

# Exponer puertos (igual que en Jenkins)
EXPOSE 8080 50000


