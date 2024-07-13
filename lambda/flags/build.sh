#!/bin/sh

# Build the developer image
docker build -t flags:latest \
             -f Dockerfile.dev .

# Run the developer container

# -p Publishes port 9000 to host's 8080. For local testing using the Lambda RIE
# -it Start the container with an interactive terminal
# --rm Remove the container when it is exited
# -v Mount. Creates a live link between the host and container file system
#   * ~/.aws makes AWS credentials available
#   * ./R contains the lambda code
#   * ./local-testing so that the lambda can be locally tested
docker run \
    -p 9000:8080 \
    -it \
    --rm \
    -v ~/.aws/:/home/rstudio/.aws \
    -v ./R:/R \
    -v ./local-testing:/local-testing \
    --name flags \
    flags:latest \
    bash