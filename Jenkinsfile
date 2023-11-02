pipeline {
      agent any
      environment { 
   NAME = "abc"
   VERSION = "${env.BUILD_ID}"
   IMAGE = "${NAME}:${VERSION}"
}  
      stages {
                
          stage ('Build') {
               agent any  
               steps {
                      sh 'docker build -f Dockerfile -t ${NAME}:${VERSION} .'
                        }
              }
          stage ('Push') {
                agent any
                
                steps {
                      sh 'docker tag ${NAME}:${VERSION} localhost:5000/${NAME}:${VERSION}'
                      sh  'docker push localhost:5000/${NAME}:${VERSION}'
                     }
          }
        stage ('Pull') {
              agent any
              steps {
              sh 'docker pull localhost:5000/${NAME}:${VERSION}'
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
              sh 'docker rmi /${NAME}:${VERSION}'
              }
   }
      }
}
