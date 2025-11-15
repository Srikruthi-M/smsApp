pipeline {
    agent any

    tools {
        jdk 'jdk17'
        maven 'maven3'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Srikruthi-M/smsApp.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package -DskipTests=false'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Publish Test Results') {
            steps {
                junit 'target/surefire-reports/*.xml'
            }
        }
    }

    post {
        success {
            echo "BUILD SUCCESSFUL 🎉"
        }
        failure {
            echo "BUILD FAILED ❌"
        }
    }
}
