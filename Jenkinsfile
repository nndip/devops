pipeline {
    agent any
    stages {
        stage('Terraform init') {
            steps {
                sh ('terraform init');
            }
        }

        stage('Terraform Action') {
            steps {
                echo "terrafom action from the parameter is --> ${action}"
                sh ('terraform ${action}');
            }
        }

        stage('Terraform other Action') {
            steps {
                echo "terrafom action from the parameter is --> ${action}"
                sh ('terraform ${action} --auto-approve');
            }
        }
    }
    
}
