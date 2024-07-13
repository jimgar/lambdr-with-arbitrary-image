#!/bin/bash

# If not using the VS Code devcontainer, the container will be busy running
# the invocation endpoint and no commands can be run in the container's terminal. 
# This means you need to post the event from a host terminal, i.e. from outside 
# of the container. We use port 9000 because it is mapped to the container's 
# port 8080 during `docker run`.
if [ "$DEVCONTAINER" = "TRUE" ]
then
    port="8080"
else
    port="9000"
fi

endpoint="http://localhost:$port/2015-03-31/functions/function/invocations"

curl -XPOST $endpoint -d '{"country":"'"$1"'"}' | jq 
echo "Country name provided was: $1"