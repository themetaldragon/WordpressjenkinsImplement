pipeline {
      agent any
      stages {
                
          stage ('Build') {
               agent any  
               steps {
                      sh 'docker build -f Dockerfile -t mywordpressimage:1 .'
                        }
              }
          stage ('Push') {
                agent any
                
                steps {
                      sh 'docker tag mywordpressimage:1 localhost:5000/mywordpressimage:1'
                      sh  'docker push localhost:5000/mywordpressimage:1'
                     }
          }
        stage ('Pull') {
              agent any
              steps {
              sh 'docker pull localhost:5000/mywordpressimage:1'
              }
   }
     stage ('Deploy') {
              agent any
              steps {
              sh 'docker compose up -d'
              }
   }
    stage ('cleanup') {
              agent any
              steps {
              sh 'docker rmi /mywordpressimage:1'
              }
   }
 
}
}
