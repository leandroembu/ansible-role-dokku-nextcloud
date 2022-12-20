#!/usr/bin/env sh

dokku redis:info redis_alfa > /tmp/redis_info

redis_host="$(grep -o -P '(?<=@).*(?=:)' /tmp/redis_info)"
redis_port="$(grep -o -P '(?<=:)(\d+)(?!.*\d)(?=$)' /tmp/redis_info)"
redis_host_password="$(grep -o -P '(?<=\/\/:).*(?=@)' /tmp/redis_info)"

dokku config:set alfa REDIS_HOST=$redis_host REDIS_HOST_PASSWORD=$redis_host_password REDIS_PORT=$redis_port
