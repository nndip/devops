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
                  if [ actoion == "plan" ]; then
                    sh ('terraform ${action}');
                  elif [ action == "destroy" ]; then
                    sh ('terrafom ${action}');
                  else
                    sh ('terraform ${action} --auto-approve');
                  fi
                  '''
                }
            }
        }
    }     
}
