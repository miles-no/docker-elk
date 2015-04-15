source ./local-env.sh
source ./env.sh
docker run -d-h elk --name elk --privileged \
    ${DNS_STUFF} ${DEV_MOUNTS} ${LINK} \
    -p 5514:5514 \
    ${HTTP_PORT} ${LS_CONF} ${AP_LOG} \
    -e HTUSER=${HTUSER} -e HTPASSWD=${HTPASSWD} \
    ${ES_PERSIST} qnib/elk:latest
