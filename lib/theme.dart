import 'package:flutter/material.dart';

/// Colores tomados del mockup de alta fidelidad incluido en el ZIP.
/// Centralizarlos permite ajustar todo el diseño desde un solo archivo.
abstract final class CampusColors {
  static const background = Color(0xFFF4F5FA);
  static const card = Color(0xFFFFFFFF);
  static const surface = Color(0xFFEEF0F8);
  static const primary = Color(0xFF5B4FE8);
  static const accent = Color(0xFF7C3AED);
  static const coral = Color(0xFFEF4444);
  static const cyan = Color(0xFF0891B2);
  static const text = Color(0xFF1A1A2E);
  static const muted = Color(0xFF6B7280);
  static const yellow = Color(0xFFD97706);
}

/// Tema compartido. Material 3 aporta controles accesibles; los colores,
/// bordes y espacios se ajustan para seguir el mockup.
ThemeData campusTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: CampusColors.primary,
    brightness: Brightness.light,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: CampusColors.background,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w800,
        color: CampusColors.text,
      ),
      titleLarge: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w800,
        color: CampusColors.text,
      ),
      titleMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: CampusColors.text,
      ),
      bodyMedium: TextStyle(fontSize: 13, color: CampusColors.text),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CampusColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

/// Caja base de las tarjetas blancas del prototipo.
class CampusCard extends StatelessWidget {
  const CampusCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: CampusColors.card,
    borderRadius: BorderRadius.circular(18),
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Padding(padding: padding, child: child),
    ),
  );
}

/// Etiqueta de estado, fecha o categoría con el mismo patrón visual.
class CampusBadge extends StatelessWidget {
  const CampusBadge(this.label, {super.key, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(99),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    ),
  );
}
