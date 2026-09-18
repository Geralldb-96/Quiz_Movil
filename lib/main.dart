import 'package:flutter/material.dart';

import 'screens.dart';
import 'theme.dart';

// Flutter inicia aquí y coloca CampusConnectApp en la pantalla.
void main() => runApp(const CampusConnectApp());

/// Configuración global. La pantalla de acceso es la primera vista.
class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Campus Connect',
    debugShowCheckedModeBanner: false,
    theme: campusTheme(),
    home: const LoginScreen(),
  );
}

/// Reúne las cinco secciones de la barra inferior.
/// Se usa StatefulWidget porque el índice seleccionado y los estados de
/// tareas/eventos cambian al tocar la interfaz.
class CampusShell extends StatefulWidget {
  const CampusShell({super.key});

  @override
  State<CampusShell> createState() => _CampusShellState();
}

class _CampusShellState extends State<CampusShell> {
  int selected = 0;
  final Set<int> completedTasks = {};
  final Set<int> joinedEvents = {};

  @override
  Widget build(BuildContext context) {
    // El orden de páginas coincide con el orden de los destinos inferiores.
    final pages = <Widget>[
      HomeScreen(onNavigate: goTo),
      const ScheduleScreen(),
      TasksScreen(completed: completedTasks, onToggle: toggleTask),
      const NoticesScreen(),
      EventsScreen(joined: joinedEvents, onToggle: toggleEvent),
    ];
    return Scaffold(
      // IndexedStack conserva el estado local de los filtros y el día elegido
      // cuando el estudiante cambia de pestaña.
      body: SafeArea(
        child: IndexedStack(index: selected, children: pages),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: CampusColors.primary.withValues(alpha: 0.13),
        selectedIndex: selected,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: goTo,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: CampusColors.primary),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(
              Icons.calendar_month,
              color: CampusColors.primary,
            ),
            label: 'Horario',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(Icons.checklist, color: CampusColors.primary),
            label: 'Tareas',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none),
            selectedIcon: Icon(
              Icons.notifications,
              color: CampusColors.primary,
            ),
            label: 'Avisos',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_border),
            selectedIcon: Icon(Icons.star, color: CampusColors.primary),
            label: 'Eventos',
          ),
        ],
      ),
    );
  }

  // setState reconstruye la vista y muestra la pestaña solicitada.
  void goTo(int index) => setState(() => selected = index);

  // Los Set guardan solo los índices marcados durante esta sesión.
  // No se persisten: al cerrar la app vuelven al estado inicial del mockup.
  void toggleTask(int index) => setState(
    () => completedTasks.contains(index)
        ? completedTasks.remove(index)
        : completedTasks.add(index),
  );

  void toggleEvent(int index) => setState(
    () => joinedEvents.contains(index)
        ? joinedEvents.remove(index)
        : joinedEvents.add(index),
  );
}

/// Abre una pantalla de detalle conservando la pestaña anterior debajo.
void showCampusDetail(
  BuildContext context, {
  required String title,
  required String subtitle,
  required String body,
  required IconData icon,
  required Color color,
}) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => DetailScreen(
        title: title,
        subtitle: subtitle,
        body: body,
        icon: icon,
        color: color,
      ),
    ),
  );
}
