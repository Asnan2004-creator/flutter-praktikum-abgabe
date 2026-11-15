// Widget-Test für Übungsblatt 1 (angepasste Standard-App).
// Ausführen mit:  flutter test

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:termin1_app/main.dart';

void main() {
  testWidgets('Geänderter Text, Zähler und neuer Zurücksetzen-Button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Aufgabe 2 – geänderte Texte sind sichtbar
    expect(find.text('Meine erste Flutter-App'), findsOneWidget);
    expect(find.text('So oft hast du den Button gedrückt:'), findsOneWidget);

    // Zähler startet bei 0 und erhöht sich
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // Aufgabe 3 – neues UI-Element setzt den Zähler zurück
    await tester.tap(find.text('Zurücksetzen'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Farbe wurde geändert (Teal statt Standard-Lila)', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    final erwartet = ColorScheme.fromSeed(seedColor: Colors.teal);
    expect(app.theme!.colorScheme.primary, erwartet.primary);
  });
}
