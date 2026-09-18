import 'package:flutter/material.dart';

import 'data.dart';
import 'main.dart';
import 'theme.dart';

/// Zona desplazable centrada: ocupa el teléfono y limita el ancho en tablet.
class ScreenFrame extends StatelessWidget {
  const ScreenFrame({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 28),
        children: children,
      ),
    ),
  );
}

class ScreenHeading extends StatelessWidget {
  const ScreenHeading(this.title, {super.key, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(subtitle!, style: const TextStyle(color: CampusColors.muted)),
        ],
      ],
    ),
  );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading(this.text, {super.key, this.action, this.onTap});
  final String text;
  final String? action;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10),
    child: Row(
      children: [
        Expanded(
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.7,
              color: CampusColors.muted,
            ),
          ),
        ),
        if (action != null) TextButton(onPressed: onTap, child: Text(action!)),
      ],
    ),
  );
}

/// El mockup muestra un formulario. Aquí el acceso sigue siendo simulado:
/// los campos se pueden escribir, pero no se envían a ningún servidor.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final studentController = TextEditingController(text: 'EST-2024-0381');
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void dispose() {
    // Los controladores liberan los recursos usados por los campos.
    studentController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: ListView(
            padding: const EdgeInsets.all(28),
            children: [
              const SizedBox(height: 38),
              Center(
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [CampusColors.primary, Color(0xFF9B8FFF)],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: CampusColors.primary.withValues(alpha: 0.25),
                        blurRadius: 25,
                        offset: const Offset(0, 9),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Campus Connect',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 5),
              const Text(
                'Tu universidad, en un solo lugar',
                textAlign: TextAlign.center,
                style: TextStyle(color: CampusColors.muted),
              ),
              const SizedBox(height: 42),
              const Text(
                'Código de estudiante',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CampusColors.muted,
                ),
              ),
              const SizedBox(height: 7),
              TextField(
                controller: studentController,
                decoration: const InputDecoration(hintText: 'EST-2024-0381'),
              ),
              const SizedBox(height: 18),
              const Text(
                'Contraseña',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CampusColors.muted,
                ),
              ),
              const SizedBox(height: 7),
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Contraseña de demostración',
                  suffixIcon: IconButton(
                    tooltip: obscurePassword
                        ? 'Mostrar contraseña'
                        : 'Ocultar contraseña',
                    onPressed: () =>
                        setState(() => obscurePassword = !obscurePassword),
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Este acceso es una demostración sin recuperación de contraseña.',
                      ),
                    ),
                  ),
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [CampusColors.primary, Color(0xFF9B8FFF)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    minimumSize: const Size.fromHeight(52),
                  ),
                  // No valida credenciales; sustituye esta ruta cuando exista backend.
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (_) => const CampusShell(),
                    ),
                  ),
                  child: const Text(
                    'Ingresar  →',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Acceso de demostración · Sin cuenta real',
                textAlign: TextAlign.center,
                style: TextStyle(color: CampusColors.muted),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/// Resumen del día con los mismos bloques y accesos del mockup.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) => ScreenFrame(
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Miércoles, 17 sep',
                  style: TextStyle(color: CampusColors.muted),
                ),
                const SizedBox(height: 3),
                Text(
                  'Hola, Valentina 👋',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          const CircleAvatar(
            backgroundColor: CampusColors.primary,
            child: Text(
              'VM',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [CampusColors.primary, Color(0xFF4B3FCC)],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PRÓXIMA CLASE',
              style: TextStyle(
                fontSize: 11,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cálculo II',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 5,
              children: const [
                Text('10:00 – 12:00', style: TextStyle(color: Colors.white70)),
                Text('Aula 304', style: TextStyle(color: Colors.white)),
                Text('Dr. Ramírez', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
      const SectionHeading('Acceso rápido'),
      Row(
        children: [
          Expanded(
            child: QuickAccess(
              'Horario',
              Icons.calendar_month,
              CampusColors.primary,
              () => onNavigate(1),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: QuickAccess(
              'Tareas',
              Icons.edit_note,
              CampusColors.coral,
              () => onNavigate(2),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: QuickAccess(
              'Avisos',
              Icons.notifications_none,
              CampusColors.cyan,
              () => onNavigate(3),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: QuickAccess(
              'Eventos',
              Icons.star_border,
              CampusColors.yellow,
              () => onNavigate(4),
            ),
          ),
        ],
      ),
      SectionHeading(
        'Entregas hoy',
        action: 'Ver todas',
        onTap: () => onNavigate(2),
      ),
      CampusCard(
        onTap: () => showCampusDetail(
          context,
          title: campusTasks.first.title,
          subtitle: campusTasks.first.subject,
          body: campusTasks.first.description,
          icon: Icons.assignment_outlined,
          color: CampusColors.coral,
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 46,
              decoration: BoxDecoration(
                color: CampusColors.coral,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informe de laboratorio #3',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Física III · Vence hoy 23:59',
                    style: TextStyle(fontSize: 11, color: CampusColors.muted),
                  ),
                ],
              ),
            ),
            const CampusBadge('URGENTE', color: CampusColors.coral),
          ],
        ),
      ),
      SectionHeading(
        'Avisos recientes',
        action: 'Ver todos',
        onTap: () => onNavigate(3),
      ),
      for (final notice in campusNotices.take(2)) ...[
        CampusCard(
          onTap: () => showCampusDetail(
            context,
            title: notice.title,
            subtitle: notice.source,
            body: notice.body,
            icon: Icons.notifications_outlined,
            color: notice.color,
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(radius: 4, backgroundColor: notice.color),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  notice.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(width: 4),
              CampusBadge(notice.category.toUpperCase(), color: notice.color),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    ],
  );
}

class QuickAccess extends StatelessWidget {
  const QuickAccess(this.label, this.icon, this.color, this.onTap, {super.key});
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: color.withValues(alpha: 0.10),
    borderRadius: BorderRadius.circular(14),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Los botones superiores cambian el día. La agenda del prototipo es una
/// muestra estática y se presenta como tal; no inventamos clases para otros días.
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int activeDay = 2;
  static const days = ['L', 'M', 'X', 'J', 'V'];
  static const dates = ['15', '16', '17', '18', '19'];

  @override
  Widget build(BuildContext context) => ScreenFrame(
    children: [
      const ScreenHeading('Mi Horario', subtitle: 'Sep 2026 · 5° semestre'),
      Row(
        children: [
          for (var i = 0; i < days.length; i++) ...[
            Expanded(
              child: InkWell(
                onTap: () => setState(() => activeDay = i),
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: activeDay == i
                        ? CampusColors.primary
                        : CampusColors.surface,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      Text(
                        days[i],
                        style: TextStyle(
                          fontSize: 11,
                          color: activeDay == i
                              ? Colors.white70
                              : CampusColors.muted,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        dates[i],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: activeDay == i
                              ? Colors.white
                              : CampusColors.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (i < days.length - 1) const SizedBox(width: 7),
          ],
        ],
      ),
      const SizedBox(height: 17),
      if (activeDay == 2)
        for (final item in campusClasses) ...[
          CampusCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      item.start,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: item.color,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      item.end,
                      style: const TextStyle(
                        fontSize: 10,
                        color: CampusColors.muted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Container(
                  width: 4,
                  height: 55,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.teacher,
                        style: const TextStyle(
                          fontSize: 11,
                          color: CampusColors.muted,
                        ),
                      ),
                      const SizedBox(height: 7),
                      CampusBadge(item.room, color: item.color),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 9),
        ]
      else
        const EmptyMessage(
          'No hay clases registradas para este día.',
          icon: Icons.event_available_outlined,
        ),
    ],
  );
}

/// Pendientes/Entregadas comparten los datos. Marcar una tarea mueve su tarjeta
/// entre pestañas durante la sesión, sin modificar archivos ni servidores.
class TasksScreen extends StatefulWidget {
  const TasksScreen({
    super.key,
    required this.completed,
    required this.onToggle,
  });
  final Set<int> completed;
  final ValueChanged<int> onToggle;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool showCompleted = false;

  @override
  Widget build(BuildContext context) {
    final visible = [
      for (var i = 0; i < campusTasks.length; i++)
        if (widget.completed.contains(i) == showCompleted) i,
    ];
    return ScreenFrame(
      children: [
        const ScreenHeading('Tareas', subtitle: '2 vencen pronto'),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: CampusColors.surface,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              Expanded(
                child: _taskTab(
                  'Pendientes (${campusTasks.length - widget.completed.length})',
                  false,
                ),
              ),
              Expanded(
                child: _taskTab(
                  'Entregadas (${widget.completed.length})',
                  true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (visible.isEmpty)
          EmptyMessage(
            showCompleted
                ? 'Nada entregado aún'
                : 'No tienes tareas pendientes',
            icon: Icons.check_circle_outline,
          )
        else
          for (final index in visible) ...[
            _taskCard(context, index),
            const SizedBox(height: 9),
          ],
      ],
    );
  }

  Widget _taskTab(String label, bool completed) => InkWell(
    onTap: () => setState(() => showCompleted = completed),
    borderRadius: BorderRadius.circular(10),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        color: showCompleted == completed
            ? CampusColors.primary
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: showCompleted == completed ? Colors.white : CampusColors.muted,
        ),
      ),
    ),
  );

  Widget _taskCard(BuildContext context, int index) {
    final item = campusTasks[index];
    return CampusCard(
      child: Row(
        children: [
          IconButton(
            tooltip: widget.completed.contains(index)
                ? 'Marcar pendiente'
                : 'Marcar entregada',
            onPressed: () => widget.onToggle(index),
            icon: Icon(
              widget.completed.contains(index)
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: item.color,
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => showCampusDetail(
                context,
                title: item.title,
                subtitle: '${item.subject} · ${item.due}',
                body: item.description,
                icon: Icons.assignment_outlined,
                color: item.color,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      decoration: widget.completed.contains(index)
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.subject,
                    style: const TextStyle(
                      fontSize: 11,
                      color: CampusColors.muted,
                    ),
                  ),
                  const SizedBox(height: 7),
                  CampusBadge(
                    item.due,
                    color: item.urgent ? CampusColors.coral : item.color,
                  ),
                ],
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: CampusColors.muted),
        ],
      ),
    );
  }
}

/// Filtra avisos por categoría. El filtro "Todos" deja ver la lista completa.
class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});
  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  String filter = 'Todos';
  static const filters = ['Todos', 'Académico', 'Eventos', 'Bienestar', 'TI'];

  @override
  Widget build(BuildContext context) {
    final visible = campusNotices.where(
      (item) => filter == 'Todos' || item.category == filter,
    );
    return ScreenFrame(
      children: [
        const ScreenHeading('Avisos', subtitle: '2 sin leer'),
        Wrap(
          spacing: 7,
          runSpacing: 7,
          children: [
            for (final option in filters)
              ChoiceChip(
                label: Text(option),
                selected: filter == option,
                onSelected: (_) => setState(() => filter = option),
                selectedColor: CampusColors.primary,
                backgroundColor: CampusColors.surface,
                labelStyle: TextStyle(
                  fontSize: 11,
                  color: filter == option ? Colors.white : CampusColors.muted,
                ),
                side: BorderSide.none,
              ),
          ],
        ),
        const SizedBox(height: 12),
        if (visible.isEmpty)
          const EmptyMessage(
            'No hay avisos en esta categoría.',
            icon: Icons.notifications_off_outlined,
          ),
        for (final notice in visible) ...[
          CampusCard(
            onTap: () => showCampusDetail(
              context,
              title: notice.title,
              subtitle: notice.source,
              body: notice.body,
              icon: Icons.notifications_outlined,
              color: notice.color,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4,
                  height: 85,
                  decoration: BoxDecoration(
                    color: notice.read
                        ? CampusColors.muted.withValues(alpha: 0.35)
                        : notice.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CampusBadge(
                        notice.category.toUpperCase(),
                        color: notice.color,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notice.title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        notice.body,
                        style: const TextStyle(
                          fontSize: 11,
                          color: CampusColors.muted,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notice.source,
                        style: const TextStyle(
                          fontSize: 10,
                          color: CampusColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 9),
        ],
      ],
    );
  }
}

/// Banner, tarjetas fechadas y botón de inscripción visual del mockup.
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key, required this.joined, required this.onToggle});
  final Set<int> joined;
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) => ScreenFrame(
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF22243A), Color(0xFF1A1B2E)],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampusBadge('SEMANA DE LA INGENIERÍA', color: CampusColors.accent),
            SizedBox(height: 12),
            Text(
              '22 – 26 septiembre 2026',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Proyectos, conferencias y competencias',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
      const SectionHeading('Próximos eventos'),
      for (var index = 0; index < campusEvents.length; index++) ...[
        _eventCard(context, index),
        const SizedBox(height: 9),
      ],
    ],
  );

  Widget _eventCard(BuildContext context, int index) {
    final item = campusEvents[index];
    return CampusCard(
      child: Row(
        children: [
          Container(
            width: 52,
            height: 58,
            decoration: BoxDecoration(
              color: item.color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SEP',
                  style: TextStyle(
                    fontSize: 10,
                    color: item.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.day,
                  style: TextStyle(
                    fontSize: 21,
                    color: item.color,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: InkWell(
              onTap: () => showCampusDetail(
                context,
                title: item.title,
                subtitle: '${item.day} sep · ${item.place}',
                body: item.description,
                icon: Icons.event_outlined,
                color: item.color,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${item.place} · ${item.capacity}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: CampusColors.muted,
                    ),
                  ),
                  const SizedBox(height: 7),
                  CampusBadge(item.category.toUpperCase(), color: item.color),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              visualDensity: VisualDensity.compact,
              foregroundColor: joined.contains(index)
                  ? Colors.white
                  : item.color,
              backgroundColor: joined.contains(index)
                  ? CampusColors.primary
                  : Colors.white,
              side: BorderSide(
                color: joined.contains(index)
                    ? CampusColors.primary
                    : item.color,
              ),
            ),
            onPressed: () => onToggle(index),
            // Es una demostración local: no reserva cupos reales.
            child: Text(
              joined.contains(index) ? 'Inscrito' : 'Unirse',
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

/// La misma pantalla sirve para tareas, avisos y eventos. Navigator.push
/// la coloca encima de la pestaña, y la flecha de regreso la cierra.
class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.icon,
    required this.color,
  });
  final String title;
  final String subtitle;
  final String body;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: CampusColors.background,
      title: const Text('Detalle'),
    ),
    body: SafeArea(
      child: ScreenFrame(
        children: [
          CampusCard(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 42, color: color),
                const SizedBox(height: 18),
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(color: CampusColors.muted),
                ),
                const Divider(height: 32),
                Text(body, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/// Estado vacío visible cuando un filtro o lista no tiene elementos.
class EmptyMessage extends StatelessWidget {
  const EmptyMessage(this.message, {super.key, required this.icon});
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(28),
    child: Column(
      children: [
        Icon(icon, size: 42, color: CampusColors.muted),
        const SizedBox(height: 12),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: CampusColors.muted),
        ),
      ],
    ),
  );
}
