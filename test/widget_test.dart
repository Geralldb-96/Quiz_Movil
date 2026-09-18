import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_movil/main.dart';

void main() {
  testWidgets('acceso y navegación principal del nuevo diseño', (tester) async {
    await tester.pumpWidget(const CampusConnectApp());
    expect(find.text('Campus Connect'), findsOneWidget);

    await tester.tap(find.text('Ingresar  →'));
    await tester.pumpAndSettle();
    expect(find.text('Hola, Valentina 👋'), findsOneWidget);

    await tester.tap(find.text('Tareas').last);
    await tester.pumpAndSettle();
    expect(find.text('Informe de laboratorio #3'), findsOneWidget);

    await tester.tap(find.byTooltip('Marcar entregada').first);
    await tester.pumpAndSettle();
    expect(find.text('Pendientes (3)'), findsOneWidget);
    await tester.tap(find.text('Entregadas (1)'));
    await tester.pumpAndSettle();
    expect(find.text('Informe de laboratorio #3'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.star_border).last);
    await tester.pumpAndSettle();
    expect(find.text('Feria de proyectos académicos'), findsOneWidget);
  });

  testWidgets('filtra avisos y permite marcar un evento', (tester) async {
    await tester.pumpWidget(const CampusConnectApp());
    await tester.tap(find.text('Ingresar  →'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Avisos').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('TI').last);
    await tester.pumpAndSettle();
    expect(
      find.text('Mantenimiento del portal — domingo 2 a. m.'),
      findsOneWidget,
    );
    expect(find.text('Cierre de notas parciales — 20 sep'), findsNothing);

    await tester.tap(find.text('Eventos').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Unirse').first);
    await tester.pumpAndSettle();
    expect(find.text('Inscrito'), findsOneWidget);
  });
}
