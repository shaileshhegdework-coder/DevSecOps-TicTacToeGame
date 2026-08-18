{{/*
_helpers.tpl
Files starting with underscore are NOT rendered into manifests directly —
they only define reusable snippets that other templates call with `include`.
This is the Helm equivalent of a shared function/constants file.
*/}}

{{- define "tic-tac-toe.name" -}}
{{- .Chart.Name -}}
{{- end -}}
{{/* Centralizes the app's name. If you ever rename the app, change it in ONE place. */}}

{{- define "tic-tac-toe.labels" -}}
app: {{ include "tic-tac-toe.name" . }}
app.kubernetes.io/name: {{ include "tic-tac-toe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
{{/*
Standard Kubernetes recommended labels (app.kubernetes.io/*) — these aren't required,
but tools like ArgoCD, Grafana dashboards, and `kubectl get all -l ...` expect them.
This is what "professional" charts look like vs beginner ones.
*/}}
