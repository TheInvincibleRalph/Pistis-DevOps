# GitLab CI/CD Demo Steps w/ Scripts 



## Step 1: Create a New GitLab Repository
- Go to GitLab and create a new project.
- Initialize the repository with a README.md file.
- Clone the repository to your local machine using VSCode:
- Open VSCode.
- Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P on macOS).
- Type `Git: Clone` and select it.
- Enter the URL of your GitLab repository (e.g., https://gitlab.com/theinvincibleralph/gitlab-demo.git).
- Select a local folder where you want to clone the repository.
- Open the cloned repository in VSCode.

## Step 2: Create a .gitlab-ci.yml File
- In the root of your repository, create a .gitlab-ci.yml file:
- Right-click in the Explorer pane and select New File.
- Name the file .gitlab-ci.yml.
Open .gitlab-ci.yml and add the following content to define a simple pipeline:

```yml
stages:
  - build
  - test


image: node:16 

# Build stage
build_job:
  stage: build
  script:
    - npm install
    - npm run build

# Test stage
test_job:
  stage: test
  script:
    - echo "Running tests..."
    - npm test
  needs: 
    - build_job  
  dependencies:
    - build_job 
```

Commit and push the .gitlab-ci.yml file to your repository using the VSCode Git interface:

> Open the Source Control pane (Ctrl+Shift+G or Cmd+Shift+G on macOS).
Stage the changes by clicking the + icon next to the .gitlab-ci.yml file.
Enter a commit message and click the checkmark icon to commit.
Click the ... menu in the Source Control pane and select Push.

## Step 3: Trigger the Pipeline
Make a change to your repository and push it to trigger the pipeline.
Go to the "CI/CD" tab in your GitLab project to see the running pipeline.

## Step 4: Create a Pipeline with Multiple Jobs
Open .gitlab-ci.yml and modify it to include multiple jobs:

```yml
stages:
  - build
  - test
  - deploy

image: node:16 

# Build stage
build_job:
  stage: build
  script:
    - echo "Building the project..."
    - npm install

# Test stage
test_job:
  stage: test
  script:
    - echo "Running tests..."
    - npm test
  needs: 
    - build_job  
  dependencies:
    - build_job  

# Deploy stage
deploy_job:
  stage: deploy
  script:
    - echo "Deploying the project..."
    - cat dist/output.txt
  dependencies:
    - build_job
```
Commit and push the changes to your repository using the VSCode Git interface:

- Stage the changes by clicking the + icon next to the .gitlab-ci.yml file.
- Enter a commit message and click the checkmark icon to commit.
- Push the changes by clicking the ... menu and selecting Push.

## Step 5: Use Variables in Your Pipeline
Go to the "Settings" tab in your GitLab project.

Click on "CI / CD" and expand the "Variables" section.

Add a new variable (e.g., MY_VARIABLE) with a value.

Modify .gitlab-ci.yml to use the variable:

```yml
stages:
  - build
  - test
  - deploy

image: node:16 

# Build stage
build_job:
  stage: build
  script:
    - echo "Building the project..."
    - npm install

# Test stage
test_job:
  stage: test
  script:
    - echo "Running tests..."
    - npm test
  needs: 
    - build_job  
  dependencies:
    - build_job  

# Deploy stage
deploy_job:
  stage: deploy
  script:
    - echo "Deploying the project..."
    - echo "Using variable: $MY_VARIABLE"
```

Commit and push the changes to your repository using the VSCode Git interface.

## Step 6: Define Artifacts
Modify .gitlab-ci.yml to define artifacts that should be preserved between jobs:

```yml
stages:
  - build
  - test


image: node:16 

# Build stage
build_job:
  stage: build
  script:
    - npm install
    - npm run build  # Assuming npm run build outputs files to dist/
  artifacts:
    paths:
      - dist/output.js

# Test stage
test_job:
  stage: test
  script:
    - echo "Running tests..."
    - npm test
  needs: 
    - build_job  
  dependencies:
    - build_job  
```

Commit and push the changes to your repository using the VSCode Git interface.


### (Source code)[https://gitlab.com/TheInvincibleRalph/gitlab_demo]