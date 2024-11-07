pipeline {
    agent any
    tools
    {
        maven 'maven3'
    }
    stages {
        stage('Checkout_Source_Code') {
            steps {
                git branch: 'main', url: 'https://github.com/satyajit-rout-312/demo.git'
            }
        }
        stage("compile-the-sourcecode")
        {
            steps
            {
                sh 'mvn compile'
            }
        }
        stage("run-testcases")
        {
            steps
            {
                sh 'mvn test'
            }
        }
        stage("create-artifact")
        {
            steps
            {
                sh 'mvn package'
            }
        }
        stage("run-securityscan")
        {
            steps
            {
                sh 'trivy fs --scanners vuln,secret,misconfig .'
            }
        }
        
        
        stage("copytheartifacttotest")
        {
            steps
            {
                sh 'scp target/devops.war ubuntu@172.31.92.154:/var/lib/tomcat9/webapps/test.war'
            }
        }
        stage("runatestcase")
        {
            steps
            {
             sh   'curl http://3.88.27.75:8080/test/ | grep -i DevOps'
             sh 'curl http://3.88.27.75:8080/test/ | grep -i apply'
            }
        }
        stage("deplytheartifacttoprod")
        {
            steps
            {
                sh 'scp target/devops.war ubuntu@172.31.92.2:/var/lib/tomcat9/webapps/test.war'
                
            }
        }
    }
