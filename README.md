# Example of Dockerfile for Go application

## Introduction

In this repository, you can find an example of a two-stage [Dockerfile](https://docs.docker.com/reference/dockerfile/#dockerfile-reference) for building images of your Go applications. As an example a simple Hello World HTTP server is used. The server does nothing useful, just returns `Hello world from our server` message.

## Building application without Docker

Since this is an example of a simple two-stage Dockerfile, this will not be very useful, but can help you check that application runs the same with and without Docker.

Build the project with:
```bash
make build
```

Then you can run the application with:
```bash
make run
```

Once the application is running, you can access it at [http://localhost:8080/index](http://localhost:8080/index).

## Building application with Docker

To build a Docker image of our application, just run:
```bash
make docker
```

You will be able to start an instance of the application with:
```bash
make docker-run
```

## Blog post with explanation

Coming soon!
