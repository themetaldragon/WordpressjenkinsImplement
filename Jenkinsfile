pipeline {
      agent any
      stages {
                
          stage ('Build') {
               agent any  
               steps {
                      sh 'docker build -f Dockerfile -t mywordpressimage:${env.GIT_COMMIT} .'
                        }
              }
          stage ('Push') {
                agent any
                
                steps {
                      sh 'docker tag mywordpressimage:${env.GIT_BRANCH} localhost:5000/mywordpressimage:${env.GIT_COMMIT}'
                      sh  'docker push localhost:5000/mywordpressimage:${env.GIT_COMMIT}'
                     }
          }
        stage ('Pull') {
              agent any
              steps {
              sh 'docker pull localhost:5000/mywordpressimage:${env.GIT_COMMIT}'
              }
   }
     stage ('Deploy') {
              agent any
              steps {
              sh 'docker-compose up -d'
              }
   }
    stage ('Branch') {
              agent any
              steps {
              sh 'echo $GIT_BRANCH'
              }
   }     
    stage ('cleanup') {
              agent any
              steps {
              sh 'docker rmi /mywordpressimage:${env.GIT_COMMIT}'
              }
   }
      }
}
