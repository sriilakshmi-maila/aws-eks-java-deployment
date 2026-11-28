# TrainBook Application Deployment on Amazon EKS using Terraform, Helm, Argo CD & Prometheus

## Project Overview

This project demonstrates the end-to-end deployment of a Java-based TrainBook application on Amazon Elastic Kubernetes Service (EKS) using Infrastructure as Code, containerization, GitOps, and monitoring.

The infrastructure is provisioned using Terraform. The application is containerized using Docker and stored in Amazon ECR. Helm manages Kubernetes deployments, while Argo CD implements GitOps-based continuous deployment. Prometheus and Grafana provide cluster monitoring and visualization.

## Architecture


Developer
   |
   v
GitHub Repository
   |
   v
GitHub Actions (CI Pipeline)
   |
   v
Build Java Application (Maven)
   |
   v
Docker Image Build
   |
   v
Amazon ECR
   |
   v
Update Helm Image Tag in GitHub
   |
   v
Argo CD (GitOps)
   |
   v
Amazon EKS Cluster
   |
   v
TrainBook Application Pods
   |
   v
Kubernetes Service
   |
   v
Application Access


**Infrastructure and Monitoring:**
- Terraform provisions the AWS infrastructure.
- Prometheus collects Kubernetes metrics.
- Grafana visualizes cluster and resource metrics.

## Technologies Used

| Cloud | AWS |
| Infrastructure as Code | Terraform |
| Containerization | Docker |
| Container Registry | Amazon ECR |
| Container Orchestration | Amazon EKS, Kubernetes |
| Package Management | Helm |
| GitOps | Argo CD |
| CI/CD | GitHub Actions |
| Monitoring | Prometheus, Grafana |
| Build Tool | Maven |
| Application | Java |

## Infrastructure Provisioning

Terraform is used to provision:
- Amazon VPC
- Public subnets across two Availability Zones
- Internet Gateway and route tables
- IAM roles and policies
- Amazon EKS cluster
- Managed worker node group

## CI/CD Pipeline

GitHub Actions automates the application build and image publishing process.

1. Checks out the source code.
2. Sets up Java 17.
3. Builds the application using Maven.
4. Configures AWS credentials.
5. Authenticates with Amazon ECR.
6. Builds and pushes the Docker image.
7. Updates the image tag in Helm values.
8. Commits and pushes the updated Helm configuration to GitHub.

## GitOps with Argo CD

Argo CD monitors the GitHub repository and automatically synchronizes the Helm chart with the EKS cluster.

Automated synchronization is configured with:
- Self-healing
- Pruning
- Automatic deployment of Git changes

## Kubernetes Deployment with Helm

Helm manages the TrainBook Kubernetes resources using reusable templates.

The deployment includes:
- Kubernetes Deployment
- Kubernetes Service
- Service Account
- Configurable replica count and container image

## Monitoring with Prometheus and Grafana

Prometheus collects Kubernetes cluster metrics, while Grafana provides dashboards to visualize:
- Cluster CPU utilization
- Memory utilization
- Node resource usage
- Kubernetes workload metrics

## Repository Structure

**text
aws-eks-java-deployment/
│
├── .github/
│   └── workflows/
│       └── mavenci.yaml
│
├── resources/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── cluster.tf
│   └── iam.tf
│
├── helm/
│   └── trainbook/
│       ├── templates/
│       ├── Chart.yaml
│       └── values.yaml
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── Dockerfile
├── argocd-application.yaml
├── .gitignore
└── README.md
```
````
## Key Learning Outcomes

- Provisioned AWS infrastructure using Terraform.
- Containerized a Java application using Docker.
- Published container images to Amazon ECR.
- Deployed applications on Amazon EKS.
- Managed Kubernetes resources using Helm.
- Implemented GitOps using Argo CD.
- Automated image building and publishing with GitHub Actions.
- Monitored Kubernetes workloads using Prometheus and Grafana.

## Future Improvements

- Configure GitHub Actions with AWS OIDC authentication.
- Implement Kubernetes autoscaling.
- Add application-level alerting.
```
