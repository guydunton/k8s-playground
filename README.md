# EKS Playtime

<img src="https://upload.wikimedia.org/wikipedia/commons/3/39/Kubernetes_logo_without_workmark.svg" alt="kubernetes" width="200"/>

## What

This repo contains some exercises to do which provide an introduction to Kubernetes. It assumes very little knowledge of Kubernetes but does require knowledge of Docker.

There are 2 projects:

- A backend service written in Rust which provides random greetings & goodbyes.
- A frontend service, written in Elm which can call the backend service.

## Pre-requisites

- AWS CLI
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
