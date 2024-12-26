pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node:16'
        NGINX_CONTAINER = 'nginx'
    }

    stages {
        stage('Clonar código') {
            steps {
                git branch: 'main', url: 'https://github.com/EderLG2020/Jenkins.git'
            }
        }

        stage('Construir imagen Docker de Node') {
            steps {
                script {
                    docker.build("nodejs-app", "./app")
                }
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                script {
                    docker.image('nodejs-app').inside {
                        sh 'npm test'  // Ejecuta tus pruebas de Node.js aquí
                    }
                }
            }
        }

        stage('Desplegar en Nginx') {
            steps {
                script {
                    // Se asume que Nginx y Node.js ya están configurados correctamente
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Limpiar el workspace después de cada ejecución
        }
    }
}
