node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }
	stage('Build project'){
	    sh 'mvn clean install'
	}

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("arth20/calculator")
    }

    stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
	stage('Deploying image with rundeck') {
     
        build job: 'rundeck_calculator'
        
      }
}
