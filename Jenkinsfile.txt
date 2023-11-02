pipeline {
      agent any
      stages {
                
          stage ('Build') {
               agent any  
               steps {
                      sh 'docker build -f Dockerfile -t myimage1 .'
                        }
              }
          stage ('Push') {
                agent any
                
                steps {
                      sh 'docker tag myimage1 localhost:5000/myimage1'
                      sh  'docker push localhost:5000/myimage1'
                     }
          }
        stage ('Pull') {
              agent any
              steps {
              sh 'cd mydockerimages'
              sh 'docker pull localhost:5000/myimage1:latest'
              }
   }
    stage ('cleanup') {
              agent any
              steps {
              sh 'docker rmi myimage1:latest'
              }
   }
 
}
}
