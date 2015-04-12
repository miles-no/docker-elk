# docker-elk

The ELK Container used is 
https://registry.hub.docker.com/u/qnib/elk/

The startup script are slighly modified.

The HTTP port is mapped to port 8080 on host. If this port occupied, change the port in scripts/env.sh
```export HTTP_PORT="-e HTTPPORT=8080 -p 8080:80"```

* Install Docker

```
boot2docker init
boot2docker start
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=~.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

## Check that the docker is installed properly
docker run hello-world

## Download ELK Container
docker pull qnib/elk

## Start ELK Container in detached moduse
cd scripts
./detached
```

The Kibana dashboard shake the be available at:
http://192.168.59.103:8080/kibana/#/dashboard/file/default.json

