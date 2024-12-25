pipeline {
    agent any

    stages {
        stage('Debug') {
            steps {
                script {
                    sh 'pwd'
                    sh 'ls -la'
                }
            }
        }
        
        stage('Checkout') {
            steps {
                sshagent(['bb88a626-fa00-41cb-8821-55f2d15f6265']) {
                    git branch: 'main', url: 'git@github.com:EderLG2020/Jenkins.git'
                }
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
