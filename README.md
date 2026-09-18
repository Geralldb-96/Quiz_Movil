# Campus Connect

Frontend Flutter basado en el archivo **Wireframe y mockup Campus Connect.zip**. La app incluye acceso simulado, inicio, horario, tareas, avisos, eventos y detalles. Los datos son ficticios y permanecen en memoria durante la sesión.

## Ejecutar

```powershell
flutter pub get
flutter devices
flutter run -d ID_DEL_DISPOSITIVO
```

Para revisar el código:

```powershell
flutter analyze
flutter test
```

## Dónde está cada parte

| Archivo | Función |
| --- | --- |
| `lib/main.dart` | Inicia la app, muestra el acceso y controla la navegación inferior. Guarda temporalmente tareas entregadas e inscripciones. |
| `lib/theme.dart` | Colores del mockup y componentes visuales compartidos, como tarjetas y etiquetas. |
| `lib/data.dart` | Modelos y datos ficticios de clases, tareas, avisos y eventos. |
| `lib/screens.dart` | Contenido e interacciones de cada pantalla, incluido el detalle. |
| `test/widget_test.dart` | Prueba de acceso, pestañas y cambio de estado de una tarea. |

Los comentarios explicativos están junto al código relevante. La barra inferior cambia de pantalla; el día seleccionado y el filtro de avisos se conservan al cambiar de pestaña. Marcar tareas e inscribirse en eventos solo cambia el estado visual local. El formulario de acceso no autentica ni transmite datos.

## Decisiones de adaptación

El ZIP contiene una maqueta web de seis pantallas dentro de marcos de teléfono. En Flutter se implementaron esas pantallas como una aplicación nativa adaptable al ancho del dispositivo, sin dibujar el marco del teléfono. Se conservaron la paleta, las tarjetas, los accesos rápidos y los controles principales. La tipografía usa la fuente predeterminada de Flutter porque las fuentes del mockup no venían incluidas en el ZIP.

El prototipo web mostraba las mismas clases al seleccionar cualquier día y presentaba algunos controles sin efecto visible. En Flutter las clases ficticias se muestran en el miércoles; los otros días tienen un estado vacío. El filtro de avisos filtra realmente y las tareas marcadas aparecen en **Entregadas**. Ninguna inscripción reserva cupos reales.
