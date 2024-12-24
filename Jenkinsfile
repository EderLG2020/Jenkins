pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Usa el contenedor de Node.js para instalar dependencias y construir la app
                script {
                    docker.image('node:18.17.1').inside {
                        sh 'npm install'
                        sh 'npm run build' // Asegúrate de tener este script en package.json
                    }
                }
            }
        }

        stage('Test') {
            steps {
                // Ejecuta los tests dentro del contenedor Node.js
                script {
                    docker.image('node:18.17.1').inside {
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                // Copia los archivos generados al volumen compartido para nginx
                script {
                    sh 'cp -r dist/* /usr/share/nginx/html/'
                }
            }
        }
    }
}
