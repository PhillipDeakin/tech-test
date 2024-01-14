RegGenome Infra Tech Test 01
============================

Welcome to the RegGenome infrastructure team's technical test. Rather than a dry whiteboard exercise this is meant as a fun way to simulate the kind of problems a real systems engineer has to solve every day.

We'd like you to spend 1 hour attempting the challenge described below in advance of your next interview with us. You are not required to complete all steps if you run out of time. We'll spend 10-15 minutes during our next meeting reviewing your responses and we'll ask you to share your screen live to communicate your solutions. You're welcome to share your work with us beforehand but it's not a requirement.

## Prerequisites

You'll need Git, Terraform and a version of Docker - either Docker Desktop running locally ot something you're able to reach over the network. It'll be handy to have your favourite editor and debugging tools around too.


## Instructions

We're going to simulate a common occurrence on a startup infrastructure team. A developer, who hasn't touched the app in a while, has tried to add some new content to it. The application won't build and deploy, and they ask you to help by fixing it.

Ordinarily we'd use Terraform to deploy the app on a production environment like Kubernetes, but to keep the test short and guarantee it runs on your laptop it instead "deploys" the app to a local Docker instance.

1. Setting up
    1. Ensure this folder is a Git repository with a `main` branch
    2. Create a branch of your own. Name it `<yourname>-docker-tf-fixes`
2. Troubleshooting
    1. Figure out what's wrong and fix it so that the application runs
    2. Commit your changes
    3. Rebase your branch to `main` in case anything changed while you were fixing it
3. Fix the docs
    1. The "Building and Running" section below is poor. In a new branch, add what any newcomer will need to get the project running.
4. Standardising the work
    1. We know this isn't the only web application we're "deploying" in the same way. Now we've got a method that works, let's share our solution with other projects by turning it into a small Terraform module.
    2. The module should wrap the resources needed to build and run any similar Dockerised app
    3. Do this in a new branch from `main`
    4. Place the module in a `modules/` directory in the Terraform tree for now
    5. Commit when you're ready


Bonus:

Hooray, the application works again. Along the way you've noticed potential improvements. What can you do to make the Docker image smaller and the application more secure? Any more suggestions for how we can make it better?

    Using nginx:alpine reduces the image size to 45mb instead of the 800mb+ for ubuntu

When finished, please delete your fork of the codebase from your GitHub account.



## Building & Running

# Part 1 - Docker Build
Move to app directly    - cd app
Build the webapp image  - docker build -t <image_name>:<version_number> .
Deploy the App          - docker run -d -p 80:80 --name <container_name> <image_name>:<version_number>
Test and Confirm        - 0.0.0.0 or localhost in browser

# Part 2 - Terraform
Move to terraform directory             - cd ./tf-stack
Check terraform version                 - terraform --version
Initialise from the root of tf-stack    - terraform init
Update variables as required            - Update terraform.tfvars in editor of your choice
Plan the deployment                     - terraform plan 
Check plan thouroughly!
Deploy                                  - terraform deploy and "yes" when happy

Done with Terraform.

## Version Update
1.0 - Original Version
1.1 - 14/01/24 - Updated to use nginx:alpine instead of ubuntu

## Thought Process - Docker - 40mins
Try a docker build, see where the the build failed
Update ubuntu to 22.04 and worked
Couldnt get nginx to deploy correctly with the config file and saw the use of ubuntu image was overkill
Swithed to nginx:alpine as easier to work with
Forgot about caching - deleted browser history
Trial,Error and Tweaks to Dockerfile and nginx.conf
docker run -d -p 80:80 --name x x:latest - Working!
Document/Cleanup

## Thought Process - Terraform - 25mins
Move to modules/webapp
battled with Apple M1 to get terraform plan working
Couldnt get terraform apply working 
variablised the module