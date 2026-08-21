#!/usr/bin/env bash
set -Eeuo pipefail
for pair in "Portal=3000" "ERPNext=8080" "frePPLe=9000" "OpenMES=80" "Fleetbase=4200"; do
  name="${pair%%=*}"
  port="${pair##*=}"
  if curl -fsS --max-time 3 "http://localhost:$port" >/dev/null 2>&1; then
    printf '%-12s LISTO  http://localhost:%s\n' "$name" "$port"
  else
    printf '[%-10s detenido o iniciando]\n' "$name"
  fi
done
