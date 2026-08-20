# Simulación SR-01

La práctica representa cuatro estaciones: corte, ensamblaje, prueba térmica y embalaje. Cada unidad solicita un recurso, procesa y continúa a la siguiente estación.

## Escenarios

- `base`: un puesto de prueba térmica, 40 minutos por unidad.
- `capacity`: dos puestos de prueba térmica, 40 minutos por unidad.

## Ejecución

```bash
python -m pip install -r requirements.txt
python sr01_salabim.py --scenario base
python sr01_salabim.py --scenario capacity
```

El modelo fija una semilla para que los equipos puedan comparar resultados. La extensión didáctica consiste en cambiar un solo parámetro por corrida: capacidad, tiempo de prueba o variabilidad.
