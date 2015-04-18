## Task

http://goo.gl/Q68bfr

# ELK on Windows
Follow this howto to get the ELK stack running on Windows: 

https://community.ulyaoth.net/threads/how-to-install-logstash-on-a-windows-server-with-kibana-in-iis.17/

Note that the IIS steps (6 - 10) can be skipped. Kibana will be accessible locally on port 5601.

# Plain ELK Stack Linux / MAC

## Elastic Search
```
## Elastic Search
curl -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.1.tar.gz
tar xzvf elasticsearch-1.5.1.tar.gz
cd elasticsearch-1.5.1
bin/elasticsearch &
curl -X GET http://localhost:9200/
cd ..
```

## Kibana Linux 64 bit
```
curl -O https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz
tar zxvf kibana-4.0.2-linux-x64.tar.gz 
cd kibana-4.0.2-linux-x64/ 
./bin/kibana &
curl -X GET http://localhost:5601/
cd ..
```
## Kibana MAC OS 64bit
```
##  Kibana MAC OS 64bit 
curl -O https://download.elastic.co/kibana/kibana/kibana-4.0.2-darwin-x64.tar.gz
tar zxvf kibana-4.0.2-darwin-x64.tar.gz
cd kibana-4.0.2-darwin-x64
./bin/kibana &
curl -X GET http://localhost:5601/
cd ..
```



## Logstash
```
## Logstash
curl -O https://download.elastic.co/logstash/logstash/logstash-1.4.2.tar.gz
tar zxvf logstash-1.4.2.tar.gz
cd logstash-1.4.2
curl -O https://raw.githubusercontent.com/miles-no/docker-elk/master/logstash/oppg_1.conf
bin/logstash  -f oppg_1.conf
##  stdin -> logstash -> stdout
```



# docker-elk
The ELK Container used is 
https://registry.hub.docker.com/u/qnib/elk/

The startup script are slightly modified.

The HTTP port is mapped to port 8080 on host. If this port is occupied, change the port in ``scripts/env.sh``

```export HTTP_PORT="-e HTTPPORT=8080 -p 8080:80"```

Some directories in the docker container are exposed to the host:
The locations are defined in ``scripts/env.sh``
```
## OPTIONAL -> if you want to store Elasticsearchs data outside
export ES_PERSIST="-v ${HOME}/elasticsearch:/var/lib/elasticsearch"

### OPTIONAL -> To use a mapped in configuration directory
# if not used, the default will be used within the container
export LS_CONF="-v ${HOME}/logstash.d/:/etc/logstash/conf.d/"

### OPTIONAL -> map apache2 config into container
export AP_LOG="-v ${HOME}/var/log/apache2/:/var/log/apache2"
```

The username and password are also specified in ``scripts/env.sh``
```
# if a user is set and no passwd, the user will be set as password
export HTUSER=kibana
export HTPASSWD=secretpw
```

* Download and install Docker
* Mac and Windows requires boot2docker:
  
  * Intro  
  http://boot2docker.io/  
  https://github.com/boot2docker/boot2docker  
  * Install  
  https://docs.docker.com/installation/mac/  
  https://docs.docker.com/installation/windows/  
  * Download  
  https://github.com/boot2docker/osx-installer/releases  
  https://github.com/boot2docker/windows-installer/releases  
  * Share  
For Mac users the folder /Users is automatically shared with Docker. Please follow this guide in order share a map between a Docker image and Windows host: http://www.incrediblemolk.com/sharing-a-windows-folder-with-the-boot2docker-vm/


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


