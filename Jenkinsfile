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
                  echo "terraform action from the parameter is --> ${action}"
                  sh '''#!/bin/bash
                  if [ ${action} == "plan" ]; then
                    'terraform ${action}'
                  elif [ ${action} == "destroy" ]; then
                    'terrafom ${action}'
                  else
                    'terraform apply --auto-approve'
                  fi
                  '''
                }
            }
        }
    }
    
}
