#!/usr/bin/env sh
dokku redis:info nextcloud > /tmp/redis_info
redis_host="$(grep -o -P '(?<=@).*(?=:)' /tmp/redis_info)"
redis_port="$(grep -o -P '(?<=:)(\d+)(?!.*\d)(?=$)' /tmp/redis_info)"
redis_host_password="$(grep -o -P '(?<=\/\/:).*(?=@)' /tmp/redis_info)"

echo "redis_host: $redis_host"
echo "redis_port: $redis_port"
echo "redis_host_password: $redis_host_password"
