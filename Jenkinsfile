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
                script {
                  echo "terrafom action from the parameter is --> ${action}"
                  sh '''#!/bin/bash
                  if [ ${action} == "plan" ]; then
                    sh ('terraform plan');
                  elif [ ${action} == "destroy" ]; then
                    sh ('terraform destroy');
                  else
                    sh ('terraform apply --auto-approve');
                  fi
                  '''
                }
            }
        }
    }
    
}
