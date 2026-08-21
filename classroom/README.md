# Estructura de entregas para la cátedra

GitHub Classroom puede utilizarse con la organización educativa `UPA-Produccion-y-Logistica`. Cada actividad puede partir de este repositorio como plantilla, crear un repositorio por alumno o equipo y ofrecer GitHub Codespaces como entorno de trabajo en el navegador.

## Secuencia recomendada

1. `01-gestion-integral`: pedido, stock, BOM y orden de fabricación.
2. `02-planificacion-aps`: plan de producción y recurso restrictivo.
3. `03-ejecucion-mes`: trazabilidad de lote y tiempos reales.
4. `04-gemelo-digital`: comparación de escenarios base/capacity.
5. `05-transporte`: asignación de vehículos y rutas.

## Convención de entrega

Cada equipo entrega un `README.md`, evidencia de resultados y una reflexión de decisión. El workflow del repositorio principal sirve como plantilla para validar que la simulación se ejecuta correctamente.

## Costo y operación bajo demanda

La propuesta utiliza el GitHub Team educativo ya habilitado, GitHub Actions para validar la simulación y Codespaces para iniciar los módulos reales solo durante la práctica. No se contrata hosting permanente. El repositorio incluye `.devcontainer/` y `online/` con los perfiles `planning`, `execution` y `all`.

En Codespaces, el flujo del alumno es:

1. Aceptar la actividad en GitHub Classroom.
2. Abrir el repositorio en Codespaces.
3. Ejecutar `./online/start.sh planning`, `./online/start.sh execution` o `./online/start.sh all`.
4. Abrir el portal desde el puerto 3000 y navegar a los módulos.
5. Ejecutar `./online/stop.sh` al finalizar.

Los datos del caso SR-01 son sintéticos. No se suben contraseñas, archivos `.env`, volúmenes ni datos de la instalación local al repositorio público.
