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
                sh '''#/bin/bash

                if [ ${action} == "plan" ]; then
                  sh ('terraform ${action}')
                elif [ ${action} == "destroy" ]; then
                  sh (terraform ${action}')
                else
                  sh (terrafom ${action} --auto-approve)
                fi
                '''
            }
        }
    }
    
}
