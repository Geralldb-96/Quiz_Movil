import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_movil/main.dart';

void main() {
  testWidgets('navega desde bienvenida hasta tareas y detalle', (tester) async {
    await tester.pumpWidget(const CampusConnectApp());
    expect(find.text('Campus Connect'), findsOneWidget);
    await tester.tap(find.text('Ingresar como estudiante'));
    await tester.pumpAndSettle();
    expect(find.text('Hola, Valentina 👋'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.checklist_outlined).first);
    await tester.pumpAndSettle();
    expect(find.text('Wireframe de aplicación'), findsOneWidget);
    await tester.tap(find.text('Wireframe de aplicación'));
    await tester.pumpAndSettle();
    expect(find.text('Diseña cinco pantallas de baja fidelidad con navegación, títulos y acciones claras.'), findsOneWidget);
  });
}
