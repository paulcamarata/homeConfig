pipeline {
    ansiblePlaybook become:true, credentialsId: '62c929d2-5f29-4bdb-b9f1-3c9f855100ae', extras: '--syntax-check',inventory: 'tests/ansible_hosts', playbook: 'install-jenkins.yml'
}