pipeline {
    agent any

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir() // Elimina todo el contenido del workspace
            }
        }
        
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/EderLG2020/Jenkins.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.image('node:18.17.1').inside('-v $WORKSPACE:/app -w /app') {
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image('node:18.17.1').inside('-v $WORKSPACE:/app -w /app') {
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                    if [ -d dist ]; then
                        cp -r dist/* /usr/share/nginx/html/
                    else
                        echo "El directorio 'dist' no existe. Asegúrate de que 'npm run build' lo haya creado."
                        exit 1
                    fi
                    '''
                }
            }
        }
    }
}
