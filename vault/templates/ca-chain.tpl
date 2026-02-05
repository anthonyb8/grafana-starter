{{- $role := env "PKI_ROLE" -}}
{{- with secret (printf "pki/issue/%s" $role) (printf "common_name=%s.internal" (env "HOSTNAME")) (printf "ip_sans=127.0.0.1,%s" (env "HOST_IP")) "alt_names=postgres,postgres.internal,loki.internal,prometheus.internal,grafana.internal"}}
{{ range .Data.ca_chain }}{{ . }}
{{ end }}
{{- end }}
