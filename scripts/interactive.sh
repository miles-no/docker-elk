source ./local-env.sh
source ./env.sh
docker run -t -i --rm -h elk --name elk --privileged \
    ${DNS_STUFF} ${DEV_MOUNTS} ${LINK} \
    ${HTTP_PORT} ${LS_CONF} ${AP_LOG} \
    -p 5514:5514 \
    -e HTUSER=${HTUSER} -e HTPASSWD=${HTPASSWD} \
    ${ES_PERSIST} qnib/elk:latest bash
