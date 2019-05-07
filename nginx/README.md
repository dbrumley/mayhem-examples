# NGINX example

This is an example that shows how to get NGINX running in Mayhem.

As an alternate to what you see here, you could also use the following
Mayhemfile:

```
# Mayhemfile version specifier
version: '0.6'

# Project name that the target belongs to
project: nginx

# Target name (should be unique within the project)
target: nginx

# Base image to run the binary in.
baseimage: nginx

# Time that analysis will run for in seconds - if absent, run forever
duration: 300

# List of commands used to test the target
cmds:

  # Command used to start the target, "@@" is the input file
  - cmd: /usr/sbin/nginx -g "daemon off;"

    ## Uncomment to change default dir (/) from which the target is invoked
    #chdir: /

    ## Uncomment the block below to define environment variables
    #env:
    #  MY_ENV_VAR: MY_ENV_VALUE

    ## If this is a network target, uncomment the block below and remove
    ## the @@ input file reference in the cmd (you can either test network or
    ## file inputs, not both).
    network:
      url: tcp://localhost:80  # protocol, host and port to analyze
      is_client: false           # target is a client-side program
      timeout: 2.0               # max seconds for sending data
```
