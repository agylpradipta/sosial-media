node {
    stage("Check Namespace Production and Staging"){
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
             sh 'sudo -u ubuntu -H sh -c "kubectl create namespace staging"'
             sh 'sudo -u ubuntu -H sh -c "kubectl create namespace production"'
        }
    }
    
    stage("Git Clone"){

        git credentialsId: 'GIT_HUB_CREDENTIALS', url: 'https://github.com/agylpradipta/sosial-media.git'
    }

    stage("Create Images Production"){
       sh 'sudo -u ubuntu -H sh -c "kubectl apply -f pesbuk-staging.yaml"'
    }
    
    stage("kubernetes deployment"){
       sh 'sudo -u ubuntu -H sh -c "kubectl apply -f pesbuk-staging.yaml"'
    }
    
    stage("inggress network"){
       sh '''
       sudo -u ubuntu -H sh -c "sudo chmod +x network-ingress.sh"
       sudo -u ubuntu -H sh -c "./network-ingress.sh"
       '''
    }
    
    stage("apply inggress pesbuk staging"){
       sh 'sudo -u ubuntu -H sh -c "kubectl apply -f ingress-pesbuk-staging.yaml"'
    }
    
}