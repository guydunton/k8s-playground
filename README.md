# EKS Playtime

## What

This project contains 2 projects:

- A backend service written in Rust which provides random greetings & goodbyes.
- A frontend service, written in Elm which can call the backend service.

## Pre-requisites

- AWS cli
- docker installed
- docker-compose installed
- kubectl installed

## Run locally

You can try out the services using the command:

```bash
docker-compose up --build
```

## Tutorials

0. [Kubernetes terminology](./tutorials/0._kubernetes_terminology.md)
1. [Try out the services](./tutorials/1._Try_out_the_services.md)
2. [Login to Kubernetes](tutorials/2._Login_to_Kubernetes.md)
3. [Deploy the backend to Kubernetes](tutorials/3._Deploy_the_backend_to_Kubernetes.md)
4. [Deploy the frontend to kubernetes](tutorials/4._Deploy_the_frontend_to_kubernetes.md)
