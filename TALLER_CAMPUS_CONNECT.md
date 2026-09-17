# Taller Campus Connect

Este archivo reúne una propuesta de análisis, cinco wireframes y las decisiones de diseño del frontend. Revísala con tu equipo y cambia lo que no represente sus propias decisiones. Las capturas y resultados de ejecución deben obtenerse en el dispositivo que usen para la entrega.

## 1. Análisis del usuario

**Usuario:** Valentina Gómez, estudiante universitaria de 19 años. Necesita encontrar horario, tareas, avisos y eventos con pocos pasos.

| Pregunta | Respuesta propuesta |
| --- | --- |
| ¿Qué consulta con mayor frecuencia? | La siguiente clase, sus entregas próximas y los avisos recientes. |
| ¿Qué acción debe estar en inicio? | Abrir horario o tareas con un toque. |
| ¿Qué debe verse sin desplazarse? | Saludo, resumen del día y accesos rápidos. |
| ¿Qué puede confundir? | Iconos sin texto, fechas ambiguas y mezclar tareas con eventos. |
| ¿Qué estilo conviene? | Interfaz limpia, contraste alto, tarjetas legibles y navegación inferior con etiquetas. |

**Alcance:** acceso simulado y datos locales. No hay autenticación, persistencia ni servicios externos.

## 2. Wireframes de baja fidelidad

### Pantalla 1 Bienvenida

```text
┌──────────────────────────────┐
│                              │
│        [ícono campus]        │
│       Campus Connect         │
│  Tu vida académica en un     │
│         solo lugar           │
│                              │
│ [ Ingresar como estudiante ] │
│   Acceso de demostración     │
└──────────────────────────────┘
```

### Pantalla 2 Inicio

```text
┌──────────────────────────────┐
│ Hola, Valentina              │
│ Resumen de tu campus         │
│ ┌──────────────────────────┐ │
│ │ Tu día: 2 clases, 2      │ │
│ │ tareas  [Ver horario]    │ │
│ └──────────────────────────┘ │
│ [Tareas]       [Eventos]     │
│ Próxima clase                │
│ [Programación móvil]         │
│ Aviso reciente               │
│ [Inscripciones abiertas]     │
│ Inicio Horario Tareas Eventos│
└──────────────────────────────┘
```

### Pantalla 3 Horario

```text
┌──────────────────────────────┐
│ Horario                      │
│ Tus clases de esta semana    │
│ Lunes                        │
│ [10:00 Programación móvil]   │
│ [14:00 Diseño de interfaces] │
│ Martes                       │
│ [08:00 Análisis de datos]    │
│ Inicio Horario Tareas Eventos│
└──────────────────────────────┘
```

### Pantalla 4 Tareas

```text
┌──────────────────────────────┐
│ Tareas                       │
│ Actividades pendientes       │
│ [Wireframe de aplicación >]  │
│ [Laboratorio Flutter     >]  │
│                              │
│ Si no hay tareas:            │
│ No tienes tareas pendientes  │
│ Inicio Horario Tareas Eventos│
└──────────────────────────────┘
```

### Pantalla 5 Eventos y detalle

```text
┌──────────────────────────────┐
│ Eventos y avisos             │
│ [Feria de proyectos      >]  │
│ [Charla de bienestar     >]  │
│ Inicio Horario Tareas Eventos│
└──────────────────────────────┘
            ↓ tocar tarjeta
┌──────────────────────────────┐
│ < Detalle de evento          │
│ [ícono]                      │
│ Feria de proyectos           │
│ Viernes · Auditorio          │
│ Descripción del evento       │
└──────────────────────────────┘
```

## 3. Mockup y prototipo

La implementación Flutter es el mockup de alta fidelidad y el prototipo navegable. Usa fondo `#F5F7FC`, texto principal `#17243A`, azul `#335CFF`, tarjetas blancas con esquinas redondeadas, Material Icons y navegación inferior con etiquetas. La tipografía es la predeterminada de Material. Las tarjetas de tareas y eventos abren el detalle. El botón de bienvenida entra al inicio.

Para mostrar las cinco pantallas, ejecuta la app y captura bienvenida, inicio, horario, tareas, eventos y detalle. Comprueba cómo se ve en teléfono y tablet.

## 4. Uso de IA para registrar y revisar

| Prompt usado | Propuesta de IA | Revisión humana necesaria |
| --- | --- | --- |
| “Propón una estructura simple para una app académica con horario, tareas y eventos” | Pantallas y navegación inferior | Confirmar que coincida con RF01–RF08. |
| “Crea datos ficticios para una estudiante universitaria” | Clases, tareas y eventos de ejemplo | Cambiar fechas, nombres y textos si el equipo lo decide. |
| “Sugiere una paleta legible para una app académica” | Azul, fondo claro y texto oscuro | Revisar contraste y legibilidad en el dispositivo. |
| “Explica el flujo de navegación de este código Flutter” | Bienvenida → inicio → pestañas → detalle | Cada integrante debe poder explicarlo con sus palabras. |

**Punto para explicar el código:** `CampusShell` controla la pestaña activa. `PageBody` y `InfoCard` reutilizan el diseño. `CampusItem` guarda datos ficticios. `Navigator.push` abre el detalle y la flecha de regreso vuelve a la lista.

## 5. Pruebas y evidencias

| Prueba | Acción | Esperado | Resultado real |
| --- | --- | --- | --- |
| P01 | Abrir la app | Se muestra bienvenida | Completar al ejecutar |
| P02 | Abrir Horario | Se muestran clases | Completar al ejecutar |
| P03 | Abrir Tareas | Se muestran tareas | Completar al ejecutar |
| P04 | Abrir detalle | Se muestra la descripción | Completar al ejecutar |
| P05 | Abrir Eventos | Se muestran eventos | Completar al ejecutar |
| P06 | Ejecutar en Android | Sin errores críticos | Completar al ejecutar |

En la terminal del proyecto:

```powershell
flutter devices
flutter run -d ID_DEL_DISPOSITIVO
```

Guarden capturas reales en una carpeta `evidencias/` y anoten dispositivo, fecha y resultado. La prueba automatizada en `test/widget_test.dart` comprueba el acceso a inicio, tareas y detalle, pero no sustituye la prueba manual en Android.

## 6. Reflexión para discutir en equipo

1. **Wireframe y mockup:** el primero muestra distribución y flujo sin acabado visual; el segundo añade colores, tipografía y apariencia final.
2. **Decisión principal:** mostrar el resumen y accesos rápidos en inicio reduce pasos para consultar información frecuente.
3. **Apoyo de IA:** estructura inicial, textos ficticios y código base; el equipo debe revisar y comprender el resultado.
4. **Errores detectados:** registrar errores reales observados, sin inventarlos. Si no hubo, describir ajustes de claridad o diseño.
5. **Cambios entre mockup y app:** comparar capturas propias y anotar diferencias reales.
6. **Segunda versión:** filtros por día, recordatorios y datos reales, sujetos a autenticación y backend.

## 7. Conclusión propuesta

Campus Connect reúne horario, tareas y actividades institucionales en una navegación simple. El prototipo permite recorrer las pantallas principales con datos ficticios. Antes de entregar, el equipo debe validar su funcionamiento en Android, adjuntar capturas y explicar las decisiones de diseño y el código.
