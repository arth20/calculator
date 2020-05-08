node {

    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {

        def customImage = docker.build("arth20/calculator")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
