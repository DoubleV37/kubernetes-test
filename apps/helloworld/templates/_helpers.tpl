{{/*
Return the fully qualified app name.
*/}}
{{- define "helloworld.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end -}}

{{/*
Return the chart name
*/}}
{{- define "helloworld.name" -}}
{{- printf "%s" .Chart.Name -}}
{{- end -}}

