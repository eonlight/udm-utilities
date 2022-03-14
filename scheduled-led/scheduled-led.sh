#!/bin/sh

ENDPOINT=https://127.0.0.1
USER=<USER>
PASSWD=<PASSWORD>
SITE=default
DEVICE=<DEVICE_ID>
LOG_FILE=/mnt/data/scheduled-led/scheduled-led.log

test $# -lt 1 && echo "Usage: $0 [on|off]" && exit 1

STATUS=$1

# attempt login
echo $(date): attempting to login >> ${LOG_FILE}
TOKEN=$(curl -sk -D - -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"username": "'${USER}'", "password": "'${PASSWD}'"}' ${ENDPOINT}/api/auth/login | grep TOKEN | cut -d"=" -f2)

# update led status
echo $(date): switching led ${STATUS} >> ${LOG_FILE}
curl -sk -H "Cookie: TOKEN=${TOKEN}" -X PUT -d '{"led_override":"'${STATUS}'","led_override_color_brightness":100,"led_override_color":"#0000FF"}' -H "Content-Type: application/json" -H "Accept: application/json" ${ENDPOINT}/proxy/network/api/s/${SITE}/rest/device/${DEVICE} &> /dev/null

# logout
echo $(date): attempting to logout >> ${LOG_FILE}
curl -sk -H "Cookie: TOKEN=${TOKEN}" -H "Content-Type: application/json" -H "Accept: application/json" -X POST ${ENDPOINT}/api/auth/logout &> /dev/null
