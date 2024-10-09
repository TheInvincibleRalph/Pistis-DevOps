

### Jenkins Pipeline for Node.js Application

#### Steps Overview:
- **Build**, **Test**, and **Deploy** stages.
- **Parallel execution** of unit tests and code linting for efficiency.
- **Dockerization** of the application.
- **Manual approval** before deploying to production.
- **Rollback strategy** in case of failure.
- **Notifications** for both success and failure.
- **Post-build cleanup** to manage resources.

#### Step-by-step Code Walkthrough

```groovy
pipeline {
    agent any
```
- **pipeline**: Defines the start of a Jenkins pipeline.
- **agent any**: Specifies that Jenkins should execute this pipeline on any available agent (Jenkins node). This can be changed to specific nodes if necessary.

```groovy
    environment {
        NODE_ENV = 'development'
        DOCKER_IMAGE = "my-node-app:${BUILD_NUMBER}"
        DOCKER_REGISTRY = 'docker.io/myapp'
    }
```
- **environment**: This block defines environment variables that will be used throughout the pipeline.
  - `NODE_ENV = 'development'`: Specifies the environment in which the app will run (development, staging, or production).
  - `DOCKER_IMAGE`: Defines a Docker image name, appending the Jenkins build number (`${BUILD_NUMBER}`) to tag each Docker image uniquely.
  - `DOCKER_REGISTRY`: Sets the Docker registry URL where the image will be pushed.

```groovy
    options {
        timeout(time: 30, unit: 'MINUTES')
        retry(3)
    }
```
- **options**: This block contains pipeline options:
  - `timeout`: Limits the pipeline execution to 30 minutes. If the build exceeds this time, it will be aborted.
  - `retry`: Instructs Jenkins to retry the pipeline up to 3 times if it fails.

### Stages
Each **stage** represents a different part of the CI/CD process. Let's walk through each stage:

---

```groovy
    stages {
        stage('Install Dependencies') {
            steps {
                script {
                    echo 'Installing dependencies...'
                }
                cache(path: 'node_modules', key: 'npm-cache-${BUILD_NUMBER}', fallback: true) {
                    sh 'npm install'
                }
            }
        }
```
- **Install Dependencies**: This stage installs the necessary Node.js dependencies using `npm install`.
  - `cache(path: 'node_modules', key: 'npm-cache-${BUILD_NUMBER}', fallback: true)`: Caches the `node_modules` folder, so future builds will not need to reinstall packages if the cache is still valid. This speeds up the pipeline.
  - `sh 'npm install'`: Runs the command to install the Node.js packages defined in `package.json`.

---

```groovy
        stage('Run Tests') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        script {
                            echo 'Running unit tests...'
                        }
                        sh 'npm test'
                    }
                }
                stage('Linting') {
                    steps {
                        script {
                            echo 'Running code linting...'
                        }
                        sh 'npm run lint'
                    }
                }
            }
        }
```
- **Run Tests**: This stage runs the unit tests and linting in parallel to save time.
  - **Unit Tests**: Runs `npm test` to execute the unit tests (defined in a package.json file located in the root of the repository/folder).
  - **Linting**: Runs `npm run lint` to check the code for style and potential errors using a linter (e.g., ESLint).
  - These stages are run **in parallel** to reduce the overall execution time.

---

```groovy
        stage('Build and Package') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
                script {
                    echo 'Pushing Docker image to registry...'
                    sh "docker tag ${DOCKER_IMAGE} ${DOCKER_REGISTRY}:${BUILD_NUMBER}"
                    sh "docker push ${DOCKER_REGISTRY}:${BUILD_NUMBER}"
                }
            }
        }
```
- **Build and Package**: This stage builds the Docker image for the Node.js application and pushes it to a Docker registry.
  - `docker build -t ${DOCKER_IMAGE} .`: Builds a Docker image with the tag defined by the `DOCKER_IMAGE` variable.
  - `docker tag ${DOCKER_IMAGE} ${DOCKER_REGISTRY}:${BUILD_NUMBER}`: Tags the Docker image for the registry.
  - `docker push ${DOCKER_REGISTRY}:${BUILD_NUMBER}`: Pushes the image to the specified Docker registry.

---

```groovy
        stage('Deploy to Staging') {
            environment {
                NODE_ENV = 'staging'
            }
            steps {
                script {
                    echo 'Deploying to staging...'
                    sh "docker run -d -e NODE_ENV=staging -p 3000:3000 ${DOCKER_REGISTRY}:${BUILD_NUMBER}"
                }
            }
        }
```
- **Deploy to Staging**: Deploys the application to a staging environment for testing.
  - The `NODE_ENV` is set to `staging` to ensure the correct environment-specific configuration is used.
  - `docker run -d -e NODE_ENV=staging -p 3000:3000 ${DOCKER_REGISTRY}:${BUILD_NUMBER}`: Runs the Docker container in the background (`-d`) with the `NODE_ENV=staging` environment variable. It exposes the application on port 3000.

---

```groovy
        stage('Approval') {
            steps {
                input message: 'Approve deployment to production?', ok: 'Deploy'
            }
        }
```
- **Approval**: This stage waits for manual approval before deploying to production.
  - `input message: 'Approve deployment to production?', ok: 'Deploy'`: Presents a prompt to the user, requiring manual confirmation before proceeding.

---

```groovy
        stage('Deploy to Production') {
            environment {
                NODE_ENV = 'production'
            }
            steps {
                script {
                    echo 'Deploying to production...'
                    sh "docker run -d -e NODE_ENV=production -p 80:3000 ${DOCKER_REGISTRY}:${BUILD_NUMBER}"
                }
            }
        }
```
- **Deploy to Production**: After approval, this stage deploys the application to the production environment.
  - The `NODE_ENV` is set to `production` to ensure the correct production configurations are used.
  - `docker run -d -e NODE_ENV=production -p 80:3000 ${DOCKER_REGISTRY}:${BUILD_NUMBER}`: Runs the Docker container in production, exposing it on port 80 (standard HTTP port).

### Post-build Actions

```groovy
    post {
        success {
            echo 'Build and deployment succeeded!'
            slackSend(channel: '#build-notifications', message: "SUCCESS: Build #${BUILD_NUMBER} was successful!")
        }
```
- **post**: Defines actions that happen after the pipeline completes.
  - **success**: If the pipeline succeeds:
    - `echo 'Build and deployment succeeded!'`: Outputs a success message.
    - `slackSend(...)`: Sends a Slack notification to the `#build-notifications` channel indicating the build was successful.

---

```groovy
        failure {
            echo 'Build failed!'
            slackSend(channel: '#build-notifications', message: "FAILED: Build #${BUILD_NUMBER} failed!")
            
            script {
                echo 'Rolling back to the previous version...'
                sh "docker run -d -e NODE_ENV=production -p 80:3000 ${DOCKER_REGISTRY}:previous-stable-version"
            }
        }
```
- **failure**: If the pipeline fails:
  - `echo 'Build failed!'`: Outputs a failure message.
  - `slackSend(...)`: Sends a Slack notification to notify the team that the build failed.
  - **Rollback Strategy**: If the deployment to production fails, this block rolls back to the `previous-stable-version` of the Docker image:
    - `docker run -d -e NODE_ENV=production -p 80:3000 ${DOCKER_REGISTRY}:previous-stable-version`: Restarts the previous stable version of the app in production.

---

```groovy
        always {
            script {
                echo 'Cleaning up Docker images...'
                sh 'docker system prune -f'
            }
        }
    }
}
```
- **always**: This block ensures that certain actions happen whether the build succeeds or fails.
  - `docker system prune -f`: Cleans up unused Docker images and containers to save disk space.

[SOURCE CODE](./Jenkinsfile)