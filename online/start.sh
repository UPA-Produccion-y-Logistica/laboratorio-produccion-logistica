#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE="$ROOT/online/.cache"
PROFILE="${1:-all}"
mkdir -p "$CACHE" "$ROOT/online/runtime"

clone_once() {
  local url="$1" dir="$2"
  if [[ ! -d "$CACHE/$dir/.git" ]]; then
    git clone --depth 1 "$url" "$CACHE/$dir"
  fi
}

start_portal() {
  if ! pgrep -f "http.server 3000.*online/runtime" >/dev/null 2>&1; then
    cp "$ROOT/online/launchpad.html" "$ROOT/online/runtime/index.html"
    nohup python -m http.server 3000 --directory "$ROOT/online/runtime" >/tmp/sr01-portal.log 2>&1 &
  fi
}

start_frepple() {
  docker compose -p sr01-frepple -f "$ROOT/online/frepple-compose.yml" up -d
}

start_erpnext() {
  clone_once https://github.com/frappe/frappe_docker.git frappe_docker
  docker compose -p sr01-erpnext -f "$CACHE/frappe_docker/pwd.yml" up -d
}

start_openmes() {
  clone_once https://github.com/Mes-Open/OpenMes.git openmes
  if [[ ! -f "$CACHE/openmes/.env" ]]; then cp "$CACHE/openmes/.env.example" "$CACHE/openmes/.env"; fi
  docker compose -p sr01-openmes -f "$CACHE/openmes/docker-compose.yml" up -d
}

start_fleetbase() {
  clone_once https://github.com/fleetbase/fleetbase.git fleetbase
  if [[ ! -f "$CACHE/fleetbase/api/.env" ]]; then cp "$CACHE/fleetbase/api/.env.example" "$CACHE/fleetbase/api/.env"; fi
  docker compose -p sr01-fleetbase -f "$CACHE/fleetbase/docker-compose.yml" up -d
}

start_portal
case "$PROFILE" in
  portal) ;;
  planning) start_frepple ;;
  execution) start_openmes; start_fleetbase ;;
  all) start_erpnext; start_frepple; start_openmes; start_fleetbase ;;
  *) echo "Uso: ./online/start.sh [portal|planning|execution|all]" >&2; exit 2 ;;
esac

echo
echo "SR-01 iniciado: perfil $PROFILE"
echo "Abrir el puerto 3000 desde la pestaña PORTS de Codespaces."
echo "Ver estado con: ./online/status.sh"
