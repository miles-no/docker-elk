# docker-elk

1. Install Docker
boot2docker init
boot2docker start
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=~.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
docker run hello-world
docker pull qnib/elk
