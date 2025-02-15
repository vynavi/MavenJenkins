pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/vynavi/MavenJenkins.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('maven-project-image')
                }
            }
        }
        
        stage('Run Docker Container and Build Maven Project') {
            steps {
                script {
                    docker.image('maven-project-image').inside {
                        sh 'mvn clean install'
                    }
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts allowEmptyArchive: true, artifacts: 'target/*.jar'
            }
        }

        stage('Post-Build Script') {
            steps {
                sh './post_build.sh'
            }
        }
    }

    post {
        success {
            echo 'Build and post-build tasks completed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
