pipeline {
      agent any
      stages {
                
          stage ('Build') {
               agent any  
               steps {
                      sh 'docker build -f Dockerfile -t mywordpressimage:${buildnumber} .'
                        }
              }
          stage ('Push') {
                agent any
                
                steps {
                      sh 'docker tag mywordpressimage:${buildnumber} localhost:5000/mywordpressimage:${buildnumber}'
                      sh  'docker push localhost:5000/mywordpressimage:${buildnumber}'
                     }
          }
        stage ('Pull') {
              agent any
              steps {
              sh 'docker pull localhost:5000/mywordpressimage:${buildnumber}'
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
              sh 'docker rmi /mywordpressimage:${buildnumber}'
              }
   }
      }
}
