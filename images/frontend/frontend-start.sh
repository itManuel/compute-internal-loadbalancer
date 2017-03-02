#! /bin/bash
export zone=$(curl -s -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/zone" | grep -o [[:alnum:]-]*$)

envsubst < "/etc/hosts.consul.ctmpl.tpl" > "/etc/hosts.consul.ctmpl"

# Start consul
consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -ui-dir=/usr/local/lib/consul-ui $CONSUL_SERVERS &

# Start consul-template
consul-template -template "/etc/hosts.consul.ctmpl:/etc/hosts.consul:systemctl reload dnsmasq" -retry 30s -max-stale 10s -wait 10s &

# Start the frontend microservice
/opt/www/gceme -frontend=true -port=80 -backend-service=http://$zone.haproxy-internal.service.consul:8080

