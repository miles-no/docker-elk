# docker-elk

The ELK Container used is 
https://registry.hub.docker.com/u/qnib/elk/

The startup script are slighly modified.

The HTTP port is mapped to port 8080 on host. If this port occupied, change the port in ``scripts/env.sh``

```export HTTP_PORT="-e HTTPPORT=8080 -p 8080:80"```

Some directories in the docker container are exposed to the host:
The location is defined in ``scripts/env.sh``
```
## OPTIONAL -> if you want to store Elasticsearchs data outside
export ES_PERSIST="-v ${HOME}/elasticsearch:/var/lib/elasticsearch"

### OPTIONAL -> To use a mapped in configuration directory
# if not used, the default will be used within the container
export LS_CONF="-v ${HOME}/logstash.d/:/etc/logstash/conf.d/"

### OPTIONAL -> map apache2 config into container
export AP_LOG="-v ${HOME}/var/log/apache2/:/var/log/apache2"
```

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

## Start ELK Container in detached modus
cd scripts
./detached.sh
```

The Kibana dashboard shall then be available at:
http://192.168.59.103:8080/kibana/#/dashboard/file/default.json


