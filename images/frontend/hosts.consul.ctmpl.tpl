{{range service "haproxy-internal"}}
{{.Address}} $zone.{{.Name}} $zone.{{.Name}}.service.consul{{end}}  

