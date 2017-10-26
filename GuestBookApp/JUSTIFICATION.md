# Justification

## Why Docker?

Docker was chosen because of the readily available Redis Docker image. With a single `docker run` command, Redis is up and running in a matter of seconds.

## Limitations

The guestbook application is configured to connect to redis on the loopback address. In order to use Docker, both the guestbook application and the redis server
have to be bundled together in the same container. Bundling multiple services into a single container is not considered best practice, but does allow a developer to get
up and running quickly. Breaking apart the services later into separate containers is a trivial process, and the deployment can be orchestrated with Swarm, Kubernetes, Mesos, etc.

## The Dockerfile

To save some time, the guestbook container is based off of the redis official image. 
