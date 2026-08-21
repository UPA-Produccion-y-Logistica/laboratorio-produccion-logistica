#!/usr/bin/env bash
set -Eeuo pipefail

python -m pip install --user --quiet -r simulacion/requirements.txt
chmod +x online/start.sh online/stop.sh online/status.sh
mkdir -p online/runtime online/.cache

cat <<'MSG'

SR-01 listo en Codespaces.

Portal didáctico:
  ./online/start.sh portal

Aplicaciones reales bajo demanda:
  ./online/start.sh planning    # frePPLe + simulación
  ./online/start.sh execution   # OpenMES + Fleetbase
  ./online/start.sh all         # los cuatro módulos

Para detener y liberar recursos:
  ./online/stop.sh

MSG
