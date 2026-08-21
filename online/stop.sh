#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if command -v docker >/dev/null 2>&1; then
  docker compose -p sr01-erpnext -f "$ROOT/online/.cache/frappe_docker/pwd.yml" down 2>/dev/null || true
  docker compose -p sr01-frepple -f "$ROOT/online/frepple-compose.yml" down 2>/dev/null || true
  docker compose -p sr01-openmes -f "$ROOT/online/.cache/openmes/docker-compose.yml" down 2>/dev/null || true
  docker compose -p sr01-fleetbase -f "$ROOT/online/.cache/fleetbase/docker-compose.yml" down 2>/dev/null || true
else
  echo "Docker no está disponible en este entorno; se omite la detención de contenedores."
fi
pkill -f "[h]ttp.server 3000.*online/runtime" 2>/dev/null || true
echo "Servicios SR-01 detenidos. Los volúmenes no fueron eliminados."
