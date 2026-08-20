# Laboratorio Integrado de Producción y Logística — SR-01

Demostración ejecutable para la cátedra de Producción y Logística de la Universidad Paraguayo Alemana (UPA). El caso sigue un producto ficticio —el secador de alimentos SR-01— desde el pedido hasta la entrega.

## Abrir la demostración

Abrir [`index.html`](index.html) en un navegador. No requiere servidor, instalación ni cuenta adicional: permite cambiar entre el escenario base y la mejora de capacidad, observar los KPI y explicar el flujo completo.

## Qué se demuestra

| Laboratorio | Pregunta de negocio | Herramienta / material |
| --- | --- | --- |
| Gestión integral | ¿Qué se vendió, qué falta y qué debe fabricarse? | ERPNext + `data/` |
| Planificación APS | ¿Cuál es el cuello de botella y cuándo conviene producir? | frePPLe + `practicas/02_planificacion_aps.md` |
| Ejecución MES | ¿Qué ocurrió realmente durante el lote? | OpenMES + `practicas/03_mes.md` |
| Gemelo digital | ¿Qué cambia si agregamos capacidad? | Salabim/Python + `simulacion/` |
| Transporte | ¿Cómo se entrega respetando prioridad y capacidad? | Fleetbase + `practicas/05_transporte.md` |

## Ejecutar la simulación reproducible

```bash
python -m pip install -r simulacion/requirements.txt
python simulacion/sr01_salabim.py --scenario base
python simulacion/sr01_salabim.py --scenario capacity
```

Resultado esperado de la demostración de cinco días:

| Escenario | Unidades terminadas | Throughput diario | Lead time promedio | Espera promedio en prueba térmica |
| --- | ---: | ---: | ---: | ---: |
| Base: un puesto de prueba | 58 | 11,6 | 485 min | 285 min |
| Mejora: dos puestos de prueba | 77 | 15,4 | 231,67 min | 0 min |

La conclusión didáctica es que el segundo puesto de prueba no solo aumenta la producción: reduce el lead time promedio aproximadamente 52% y elimina la cola del recurso crítico en este escenario.

## Organización del repositorio

- `index.html`: tablero visual para la presentación.
- `data/`: datos sintéticos reproducibles del caso SR-01.
- `simulacion/`: modelo Salabim y dependencias.
- `practicas/`: cinco consignas progresivas.
- `classroom/`: propuesta de organización de entregas sin depender de GitHub Classroom.
- `.github/workflows/validate.yml`: validación automática de los dos escenarios.

## Regla de trabajo para estudiantes

En la primera corrida no se cambian los datos de entrada. Cada equipo registra el escenario, parámetros modificados, KPI, decisión recomendada y limitaciones del modelo. Luego puede proponer una mejora y justificarla con evidencia.

Todos los datos son sintéticos y exclusivamente didácticos; no representan una empresa real.

## Navegación pública

- [Propuesta pedagógica aplicada con IA](propuesta.html)
- [Dashboard IoT didáctico](dashboard.html)
- [Misiones integradas de decisión](portal.html)
- [Guía operativa de laboratorios](laboratorios.html)
