# The first stage of the build uses Alpine version of pre-build Docker image
# that has Golang pre-installed. Depending on your use-case this may not be the
# optimal option. For all available versions of Docker images, navigate to this
# website: https://hub.docker.com/_/golang
FROM golang:1.22.0-alpine3.18 AS builder

# Workdir specifies the working directory inside Docker image. Some people
# prefer to use app/ directory, or something else.
WORKDIR /

# Before building our application, we have to copy all necessary files from the
# root folder of our project. It's important to mention that the path ./ is
# relative to WORKDIR specified above.
COPY go.mod *.go ./

# We can run any command using RUN command. In this case we build our Go
# application. We could also run tests, or various build scripts here.
RUN go build *.go

# Here we start the second stage of the build process. We use a super minimal
# scratch image, since Go application compile into a binary.
FROM scratch

# Again, we specify working directory, but this time it is inside scratch image
WORKDIR /

# In this step we copy the compiled binary from the previous step.
COPY --from=builder main .

# The EXPOSE command describe which ports your application is listening on. In
# our case it is port 8080.
EXPOSE 8080

# The ENTRYPOINT specify default executable, for us that's our application.
ENTRYPOINT ["./main"]
