pipeline {
    stages {
        steps {
            ansiblePlaybook('roles/install-jenkins.yml') {
                inventoryPath('tests/ansible_hosts')
                credentialsId('62c929d2-5f29-4bdb-b9f1-3c9f855100ae')
                become(true)
                extras('--syntax-check')
            }
        }
    }
}