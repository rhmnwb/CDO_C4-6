# CD12355 - Microservices at scale using AWS and Kubernetes
# Raul Herrera Marcos

## EKS
An EKS cluster manages this analytics application. The cluster only contains two pods: one with a for a  ```postgres``` database and another for the application itself.</p>
The cluster has been created with the following configuration: ```--node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2```.</p>
The ```deployment``` directory contains two files:
-  ```configmap.yaml``` with the environment variables for the database connection.
- ```coworking.yaml``` for the K8s Deployment configuration.

## Continuous Deployment Using CodeBuild and ECR
On ```PULL_REQUEST_MERGE```, the GitHub hook notifies CloudBuild which proceeds to run the pipeline as per ```codebuild.yml```.
The creates a Docker image using ```Dockerfile``` and uploads it to ECR.</p>
Run ```kubectl apply -f deployment/``` to deploy the configuration for the analytics application contained in the ```deployment``` directory.

## Troubleshooting
Verify the status of the cluster by running ```kubectl get pods``` and ensure both database and app are in ```Running``` state, as shown in the image below.</p>
![Alt text](https://github.com/rhmnwb/CDO_C4-6/blob/main/screenshots/18.%20kubectl%20get%20pods.png)</p>
Check the application logs using CloudWatch
