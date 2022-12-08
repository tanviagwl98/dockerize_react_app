pipeline {
    agent{
        label 'ec2-fleet'
    }    
    environment{
        gitCredential = 'gitlab_user_id'
        imageNameReact = 'node_ubuntu_docker'
        
    }
    stages{
        stage('Checkout'){
            steps{
                git url: 'https://gitlab.engine.capgemini-hamilton-sandbox.com/software-engineering/india/demo/docker_demo_tanvi/docker_demo_tanvi.git',
                credentialsId: gitCredential,
                branch: 'master'
            }
        }

        stage('Build'){
            steps{
                script{
                       dockerImageBuild = docker.build(imageNameReact , '--no-cache -f Dockerfile .')
                       sh 'docker image ls'       
                       sh 'docker save -o node_ubuntu_docker.tar node_ubuntu_docker'  
                       sh 'ls -ltr'         
               }
               
              rtUpload (
                    serverId: 'Sandbox_JFrog',
                    spec: '''{
                    "files": [
                                {
                                    "pattern": "node_ubuntu_docker.tar",
                                    "target": "DevAgilityDemo_Docker/node_ubuntu_docker.tar"
                                }
                            ]
                    }''',
                )
            }
        }
    }
}
