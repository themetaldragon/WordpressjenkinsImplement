pipeline {
      agent n1
      stages {
                
          stage ('Build') {
               agent n1  
               steps {
                      sh 'docker build -f Dockerfile -t mywordpressimage:1 .'
                        }
              }
          stage ('Push') {
                agent n1
                
                steps {
                      sh 'docker tag mywordpressimage:1 localhost:5000/mywordpressimage:1'
                      sh  'docker push localhost:5000/mywordpressimage:1'
                     }
          }
        stage ('Pull') {
              agent n1
              steps {
              sh 'docker pull localhost:5000/mywordpressimage:1'
              }
   }
     stage ('Deploy') {
              agent n1
              steps {
              sh 'docker-compose up -d'
              }
   }
    stage ('cleanup') {
              agent n1
              steps {
              sh 'docker rmi /mywordpressimage:1'
              }
   }
 
}
}
