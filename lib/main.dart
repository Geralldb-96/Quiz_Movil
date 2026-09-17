import 'package:flutter/material.dart';

void main() => runApp(const CampusConnectApp());

const ink = Color(0xFF17243A);
const blue = Color(0xFF335CFF);
const pale = Color(0xFFF5F7FC);

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Campus Connect',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: blue),
          scaffoldBackgroundColor: pale,
          appBarTheme: const AppBarTheme(backgroundColor: pale, foregroundColor: ink),
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
        home: const WelcomePage(),
      );
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.school_rounded, size: 90, color: blue),
                    const SizedBox(height: 24),
                    const Text('Campus Connect', textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: ink)),
                    const SizedBox(height: 12),
                    const Text('Tu vida académica en un solo lugar', textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    const SizedBox(height: 48),
                    FilledButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const CampusShell()),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text('Ingresar como estudiante'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('Acceso de demostración · Sin cuenta', textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class CampusShell extends StatefulWidget {
  const CampusShell({super.key});

  @override
  State<CampusShell> createState() => _CampusShellState();
}

class _CampusShellState extends State<CampusShell> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      DashboardPage(onNavigate: (index) => setState(() => selected = index)),
      const SchedulePage(),
      const TasksPage(),
      const EventsPage(),
    ];
    return Scaffold(
      body: SafeArea(child: pages[selected]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (index) => setState(() => selected = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.calendar_today_outlined), selectedIcon: Icon(Icons.calendar_today), label: 'Horario'),
          NavigationDestination(icon: Icon(Icons.checklist_outlined), selectedIcon: Icon(Icons.checklist), label: 'Tareas'),
          NavigationDestination(icon: Icon(Icons.event_outlined), selectedIcon: Icon(Icons.event), label: 'Eventos'),
        ],
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({super.key, required this.title, required this.children, this.subtitle});
  final String title;
  final String? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            children: [
              Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: ink)),
              if (subtitle != null) ...[
                const SizedBox(height: 5),
                Text(subtitle!, style: const TextStyle(color: Colors.black54, fontSize: 15)),
              ],
              const SizedBox(height: 22),
              ...children,
            ],
          ),
        ),
      );
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) => PageBody(
        title: 'Hola, Valentina 👋',
        subtitle: 'Esto es lo que sucede en tu campus',
        children: [
          Card(
            color: blue,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Tu día de hoy', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 14),
                const Text('2 clases  ·  2 tareas pendientes', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 18),
                FilledButton.tonal(onPressed: () => onNavigate(1), child: const Text('Ver horario')),
              ]),
            ),
          ),
          const SizedBox(height: 20),
          const SectionTitle('Accesos rápidos'),
          Row(children: [
            Expanded(child: QuickAction(icon: Icons.checklist, label: 'Tareas', onTap: () => onNavigate(2))),
            const SizedBox(width: 12),
            Expanded(child: QuickAction(icon: Icons.event, label: 'Eventos', onTap: () => onNavigate(3))),
          ]),
          const SizedBox(height: 22),
          const SectionTitle('Próxima clase'),
          const InfoCard(icon: Icons.computer, title: 'Programación móvil', detail: 'Hoy · 10:00 a. m. · Aula B204'),
          const SizedBox(height: 22),
          const SectionTitle('Aviso reciente'),
          const InfoCard(icon: Icons.campaign_outlined, title: 'Inscripciones abiertas', detail: 'Participa en la feria de proyectos'),
        ],
      );
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(text, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: ink)),
      );
}

class QuickAction extends StatelessWidget {
  const QuickAction({super.key, required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(children: [Icon(icon, color: blue, size: 30), const SizedBox(height: 8), Text(label)]),
          ),
        ),
      );
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.icon, required this.title, required this.detail, this.onTap, this.trailing});
  final IconData icon;
  final String title;
  final String detail;
  final VoidCallback? onTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          leading: CircleAvatar(backgroundColor: const Color(0xFFE9EEFF), child: Icon(icon, color: blue)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Padding(padding: const EdgeInsets.only(top: 4), child: Text(detail)),
          trailing: trailing ?? (onTap == null ? null : const Icon(Icons.chevron_right)),
          onTap: onTap,
        ),
      );
}

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});
  @override
  Widget build(BuildContext context) => const PageBody(
        title: 'Horario', subtitle: 'Tus clases de esta semana',
        children: [
          SectionTitle('Lunes'),
          InfoCard(icon: Icons.computer, title: 'Programación móvil', detail: '10:00 a. m. – 12:00 m. · Aula B204'),
          InfoCard(icon: Icons.design_services_outlined, title: 'Diseño de interfaces', detail: '2:00 p. m. – 4:00 p. m. · Aula C105'),
          SizedBox(height: 18),
          SectionTitle('Martes'),
          InfoCard(icon: Icons.analytics_outlined, title: 'Análisis de datos', detail: '8:00 a. m. – 10:00 a. m. · Sala 3'),
        ],
      );
}

class CampusItem {
  const CampusItem(this.title, this.subtitle, this.description, this.icon);
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
}

const tasks = [
  CampusItem('Wireframe de aplicación', 'Diseño de interfaces · Entrega: viernes',
      'Diseña cinco pantallas de baja fidelidad con navegación, títulos y acciones claras.', Icons.draw_outlined),
  CampusItem('Laboratorio Flutter', 'Programación móvil · Entrega: lunes',
      'Implementa el frontend con datos ficticios y verifica la navegación en Android.', Icons.code),
];

const events = [
  CampusItem('Feria de proyectos', 'Viernes · Auditorio principal',
      'Conoce los proyectos desarrollados por estudiantes y presenta tus ideas.', Icons.groups_outlined),
  CampusItem('Charla de bienestar', 'Miércoles · Sala múltiple',
      'Encuentro abierto sobre hábitos saludables y vida universitaria.', Icons.favorite_outline),
];

void openDetail(BuildContext context, CampusItem item, String category) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (_) => DetailPage(item: item, category: category),
  ));
}

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});
  @override
  Widget build(BuildContext context) => PageBody(
        title: 'Tareas', subtitle: 'Actividades pendientes',
        children: tasks.isEmpty
            ? const [EmptyState(message: 'No tienes tareas pendientes')]
            : tasks.map((item) => InfoCard(
                  icon: item.icon, title: item.title, detail: item.subtitle,
                  onTap: () => openDetail(context, item, 'Tarea'),
                )).toList(),
      );
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) => PageBody(
        title: 'Eventos y avisos', subtitle: 'Lo que pasa en el campus',
        children: events.isEmpty
            ? const [EmptyState(message: 'No hay eventos por ahora')]
            : events.map((item) => InfoCard(
                  icon: item.icon, title: item.title, detail: item.subtitle,
                  onTap: () => openDetail(context, item, 'Evento'),
                )).toList(),
      );
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(children: [
          const Icon(Icons.inbox_outlined, size: 48, color: Colors.black38),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
        ]),
      );
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.item, required this.category});
  final CampusItem item;
  final String category;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Detalle de $category'.toLowerCase())),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: ListView(padding: const EdgeInsets.all(20), children: [
                Card(child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(item.icon, size: 44, color: blue),
                    const SizedBox(height: 20),
                    Text(item.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ink)),
                    const SizedBox(height: 10),
                    Text(item.subtitle, style: const TextStyle(color: Colors.black54)),
                    const Divider(height: 32),
                    Text(item.description, style: const TextStyle(fontSize: 16, height: 1.5)),
                  ]),
                )),
              ]),
            ),
          ),
        ),
      );
}
