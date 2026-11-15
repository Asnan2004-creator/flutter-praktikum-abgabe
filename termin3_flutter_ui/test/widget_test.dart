// Widget-Tests für Praktikum Termin 3.
// Ausführen mit:  flutter test
//
// Jede Aufgabe wird über das Startmenü geöffnet und kurz geprüft –
// einmal im Querformat (wie im Browser) und auf zwei Handy-Größen.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:termin3_flutter_ui/main.dart';

/// Öffnet eine Aufgabe über das Startmenü.
Future<void> oeffne(WidgetTester tester, String titel) async {
  final eintrag = find.text(titel);
  await tester.scrollUntilVisible(eintrag, 100);
  await tester.pumpAndSettle(); // Scrollen abschließen, bevor getippt wird
  await tester.tap(eintrag);
  await tester.pumpAndSettle();
}

/// Geht zurück zum Startmenü.
Future<void> zurueck(WidgetTester tester) async {
  await tester.pageBack();
  await tester.pumpAndSettle();
}

void main() {
  // Bildschirmgrößen, mit denen jeder Test läuft (logische Pixel).
  const groessen = {
    'Browser 800x600': Size(800, 600),
    'Handy 360x640': Size(360, 640),
    'Kleines Handy 320x568': Size(320, 568),
  };

  for (final MapEntry(key: name, value: groesse) in groessen.entries) {
    group(name, () {
      Future<void> starte(WidgetTester tester) async {
        tester.view.devicePixelRatio = 1.0;
        tester.view.physicalSize = groesse;
        addTearDown(tester.view.reset);
        await tester.pumpWidget(const PraktikumApp());
      }

      testWidgets('Startseite listet alle 8 Aufgaben', (tester) async {
        await starte(tester);
        for (var i = 1; i <= 8; i++) {
          await tester.scrollUntilVisible(
            find.textContaining('Aufgabe $i –'),
            100,
          );
          expect(find.textContaining('Aufgabe $i –'), findsOneWidget);
        }
      });

      testWidgets('Aufgabe 1: zentrierter Willkommenstext', (tester) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 1 – Erste Oberfläche');
        final text = find.text('Willkommen zu Flutter UI');
        expect(text, findsOneWidget);
        expect(
          find.ancestor(of: text, matching: find.byType(Center)),
          findsWidgets,
        );
        // Text sitzt horizontal in der Bildschirmmitte.
        expect(tester.getCenter(text).dx, closeTo(groesse.width / 2, 1));
      });

      testWidgets('Aufgabe 2: Profilseite', (tester) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 2 – Profilseite');
        expect(find.text('Asnan Younis'), findsOneWidget);
        expect(find.textContaining('Wirtschaftsinformatik'), findsOneWidget);
        expect(find.byIcon(Icons.person), findsOneWidget);
        expect(find.textContaining('Flutter und Dart'), findsOneWidget);
      });

      testWidgets('Aufgabe 3: Titel, zwei Boxen nebeneinander, Button', (
        tester,
      ) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 3 – Row & Column');
        final titel = tester.getCenter(find.text('Mein Layout'));
        final box1 = tester.getCenter(find.text('Box 1'));
        final box2 = tester.getCenter(find.text('Box 2'));
        final button = tester.getCenter(find.text('Klick mich'));
        expect(box1.dy, box2.dy); // nebeneinander = gleiche Höhe
        expect(box1.dx, lessThan(box2.dx));
        expect(titel.dy, lessThan(box1.dy)); // Titel oben
        expect(button.dy, greaterThan(box1.dy)); // Button unten
      });

      testWidgets('Aufgabe 4: drei Cards untereinander', (tester) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 4 – Cards');
        expect(find.byType(Card), findsNWidgets(3));
        final y = [
          for (final t in ['Flutter', 'Dart', 'Widgets'])
            tester.getCenter(find.text(t)).dy,
        ];
        expect(y[0], lessThan(y[1]));
        expect(y[1], lessThan(y[2]));
      });

      testWidgets('Aufgabe 5: Like und Reset geben etwas auf der Konsole aus', (
        tester,
      ) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 5 – Buttons & Aktionen');

        // Konsolenausgaben nur während der beiden Klicks mitschneiden und
        // debugPrint danach sofort wiederherstellen.
        final ausgaben = <String?>[];
        final original = debugPrint;
        debugPrint = (String? m, {int? wrapWidth}) => ausgaben.add(m);
        try {
          await tester.tap(find.text('Like'));
          await tester.tap(find.text('Reset'));
        } finally {
          debugPrint = original;
        }
        expect(ausgaben, ['Like gedrückt', 'Reset gedrückt']);
      });

      testWidgets('Aufgabe 6: Zähler erhöht sich um 1', (tester) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 6 – Counter App');
        expect(find.text('0'), findsOneWidget);
        await tester.tap(find.text('+1'));
        await tester.pump();
        expect(find.text('1'), findsOneWidget);
        await tester.tap(find.text('+1'));
        await tester.tap(find.text('+1'));
        await tester.pump();
        expect(find.text('3'), findsOneWidget);
      });

      testWidgets('Aufgabe 7: große Überschrift mit Farbe', (tester) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 7 – Farben & Styling');
        final ueberschrift = tester.widget<Text>(
          find.text('Große Überschrift'),
        );
        expect(ueberschrift.style!.fontSize, 32);
        expect(ueberschrift.style!.color, Colors.deepPurple);
      });

      testWidgets(
        'Aufgabe 8: Dashboard mit AppBar, 4 Kacheln, Icons, Buttons',
        (tester) async {
          await starte(tester);
          await oeffne(tester, 'Aufgabe 8 – Bonus: Dashboard');
          expect(find.widgetWithText(AppBar, 'Dashboard'), findsOneWidget);
          expect(find.byType(Card), findsNWidgets(4));
          expect(find.byType(FilledButton), findsNWidgets(4));
          for (final icon in [
            Icons.mail,
            Icons.calendar_month,
            Icons.check_circle,
            Icons.settings,
          ]) {
            expect(find.byIcon(icon), findsOneWidget);
          }
        },
      );

      testWidgets('Zurück-Navigation führt wieder zur Startseite', (
        tester,
      ) async {
        await starte(tester);
        await oeffne(tester, 'Aufgabe 1 – Erste Oberfläche');
        await zurueck(tester);
        expect(find.text('Termin 3 – Flutter UI'), findsOneWidget);
      });
    });
  }
}
