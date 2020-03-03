# EKS Playtime

## What

This project contains 2 projects:

- A backend service written in Rust which provides random greetings & goodbyes.
- A frontend service, written in Elm which can call the backend service.

## Run locally

You can try out the services using the command:

```bash
docker-compose up --build
```

## Tutorials

1. [Try out the services](./tutorials/1._Try_out_the_services.md)
2. [Login to Kubernetes](tutorials/2._Login_to_Kubernetes.md)
3. [Deploy the backend to Kubernetes](tutorials/3._Deploy_the_backend_to_Kubernetes.md)
4. [Deploy the frontend to kubernetes](tutorials/4._Deploy_the_frontend_to_kubernetes.md)
5. [Expose the frontend to the outside world](tutorials/5._Expose_the_frontend_to_the_outside_world.md)
6. [Provide AWS access to backend](tutorials/6._Provide_AWS_access_to_backend.md)