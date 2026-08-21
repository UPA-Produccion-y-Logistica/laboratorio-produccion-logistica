# Estructura de entregas para la cátedra

Desde mayo de 2026 GitHub dejó de aceptar nuevas altas de GitHub Classroom mientras realiza una transición hacia soluciones asociadas. Por eso esta carpeta define una alternativa basada en el repositorio plantilla de `UPA-Produccion-y-Logistica`, Codespaces y entregas mediante repositorios y Pull Requests.

## Secuencia recomendada

1. `01-gestion-integral`: pedido, stock, BOM y orden de fabricación.
2. `02-planificacion-aps`: plan de producción y recurso restrictivo.
3. `03-ejecucion-mes`: trazabilidad de lote y tiempos reales.
4. `04-gemelo-digital`: comparación de escenarios base/capacity.
5. `05-transporte`: asignación de vehículos y rutas.

## Convención de entrega

Cada equipo entrega un `README.md`, evidencia de resultados y una reflexión de decisión. El workflow del repositorio principal sirve como plantilla para validar que la simulación se ejecuta correctamente.

## Flujo recomendado sin Classroom nuevo

1. El docente mantiene este repositorio como plantilla pública.
2. Para cada equipo se crea un repositorio derivado dentro de la organización.
3. El equipo abre **Code → Codespaces → Create codespace on main**.
4. El alumno ejecuta el perfil `planning`, `execution` o `all` desde la terminal integrada.
5. El equipo entrega su `README.md`, evidencias y reflexión mediante un commit o Pull Request.

Los repositorios derivados pueden ser privados si se desea corregir las entregas sin exponerlas públicamente. La configuración `.devcontainer/` se conserva al crear el Codespace.

## Costo y operación bajo demanda

La propuesta utiliza el GitHub Team educativo ya habilitado, GitHub Actions para validar la simulación y Codespaces para iniciar los módulos reales solo durante la práctica. No se contrata hosting permanente. El repositorio incluye `.devcontainer/` y `online/` con los perfiles `planning`, `execution` y `all`.

En Codespaces, el flujo del alumno es:

1. Abrir el repositorio del equipo en Codespaces.
2. Ejecutar `./online/start.sh planning`, `./online/start.sh execution` o `./online/start.sh all`.
3. Abrir el portal desde el puerto 3000 y navegar a los módulos.
4. Ejecutar `./online/stop.sh` al finalizar.

Los datos del caso SR-01 son sintéticos. No se suben contraseñas, archivos `.env`, volúmenes ni datos de la instalación local al repositorio público.
