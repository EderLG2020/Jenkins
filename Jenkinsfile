pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node:16'
        NGINX_CONTAINER = 'nginx'
    }

    stages {
        stage('Clonar código') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/EderLG2020/Jenkins.git'
                }
            }
        }

        stage('Construir imagen Docker de Node') {
            steps {
                script {
                    docker.build("jenkins-with-node", "./app")
                }
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                script {
                    docker.image('jenkins-with-node').inside('--user root') {
                        sh '''
                        # Verifica Node.js y npm
                        node -v
                        npm -v
                        # Ejecuta las pruebas
                        npm test
                        '''
                    }
                }
            }
        }


        stage('Desplegar en Nginx') {
            steps {
                script {
                    sh '''
                    docker-compose down || true
                    docker-compose up -d
                    '''
                }
            }
        }
    }

    post {
        always {
            // Limpieza del workspace
            script {
                try {
                    cleanWs()
                } catch (Exception e) {
                    echo "cleanWs plugin no encontrado. Limpieza omitida."
                }
            }
        }
    }
}
