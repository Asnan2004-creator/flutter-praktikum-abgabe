# Flutter / Dart Praktikum – Abgabe

**Asnan Younis** · Matrikelnummer **5597668** · Studiengang **Wirtschaftsinformatik**

Lösungen zu Übungsblatt Termin 1, Übungsblatt Termin 2 und Praktikum Termin 3 (Flutter UI Einstieg).
Erstellt und getestet mit Flutter 3.38.10 / Dart 3.10.9.

## Inhalt

| Ordner / Datei | Aufgaben |
|---|---|
| `termin1_app/` | Übungsblatt 1, Aufgaben 1–3: Standard-App zum Laufen gebracht und angepasst (Texte, Farbe, neuer „Zurücksetzen“-Button) |
| `termin1_dart/aufgaben.dart` | Übungsblatt 1, Aufgaben 4–6: Name und Alter ausgeben, Funktion zum Verdoppeln, zwei Zahlen addieren |
| `termin2_dart/aufgaben.dart` | Übungsblatt 2, Aufgaben 1–8: Variablen, Summe, gerade/ungerade, größere Zahl, Schleife 1–10, Summe 1–100, Funktion, Liste |
| `termin2_dart/bonus_ratespiel.dart` | Übungsblatt 2, Bonus: Ratespiel (Zahl zwischen 1 und 10) |
| `termin3_flutter_ui/` | Praktikum Termin 3, Aufgaben 1–8: eine App mit Startmenü, jede Aufgabe ist eine eigene Seite |

Der Programmcode steht jeweils in `lib/main.dart` (Flutter-Apps) bzw. in den `.dart`-Dateien (Dart-Programme). Jede Aufgabe ist im Code mit einem Kommentar markiert.

## Ausführen

Dart-Programme (im Ordner dieser Abgabe):

```bash
dart run termin1_dart/aufgaben.dart
dart run termin2_dart/aufgaben.dart
dart run termin2_dart/bonus_ratespiel.dart
```

Flutter-Apps (auf jedem verfügbaren Gerät, z. B. Chrome, Android-Emulator, iOS-Simulator):

```bash
cd termin3_flutter_ui
flutter pub get
flutter run
```

Für `termin1_app` genauso. Automatische Tests jeweils mit `flutter test`.

## Termin 3 – Überblick

| Aufgabe | Umsetzung |
|---|---|
| 1 – Erste Oberfläche | Text „Willkommen zu Flutter UI“ zentriert im Body (`Center`) |
| 2 – Profilseite | Profilbild als Icon (`CircleAvatar`), Name, Studiengang, Matrikelnummer, Beschreibung |
| 3 – Row und Column | Titel oben, zwei Boxen nebeneinander (`Row` + `Expanded`), Button darunter |
| 4 – Card Widget | Drei `Card`s untereinander mit Titel und kurzem Text |
| 5 – Buttons & Aktionen | „Like“ und „Reset“, Klick erzeugt eine Konsolenausgabe |
| 6 – Counter App | Zähler mit `StatefulWidget` und `setState()` |
| 7 – Farben & Styling | Theme, Farben, Farbverlauf, große Überschriften, Abstände |
| 8 – Bonus | Dashboard mit `AppBar`, 4 Kacheln (`GridView`), Icons und Buttons |

Die App wurde mit Widget-Tests auf drei Bildschirmgrößen geprüft (30 Tests, alle bestanden).

## Übungsblatt 1, Aufgabe 2 – Was passiert nach dem Speichern?

Durch **Hot Reload** (beim Speichern in der IDE oder mit der Taste `r` im laufenden `flutter run`) wird die Änderung sofort in der laufenden App angezeigt, ohne dass sie neu startet. Der aktuelle Zustand, z. B. der Zählerstand, bleibt dabei erhalten.

## Reflexion (Termin 3)

**Welche Widgets hast du verwendet?**
`MaterialApp`, `Scaffold`, `AppBar`, `Center`, `Text`, `Column`, `Row`, `Expanded`, `Container`, `Padding`, `SizedBox`, `CircleAvatar`, `Icon`, `Card`, `ListTile`, `ListView`, `GridView`, `SingleChildScrollView`, `ConstrainedBox`, `FittedBox`, `ElevatedButton`, `OutlinedButton`, `FilledButton`, `IconButton`, sowie `StatelessWidget` und `StatefulWidget` mit `setState()`.

**Was war einfach?**
Text, Icons und Buttons anzeigen; einfache Layouts mit `Column` und `Row`; Abstände mit `SizedBox` und `Padding`.

**Was war schwierig?**
Zu verstehen, wann man ein `StatefulWidget` braucht und wie `setState()` das Neuzeichnen auslöst; die Platzverteilung in einer `Row` (dafür `Expanded`); Layouts, die auch auf kleinen Bildschirmen nicht überlaufen (dafür `SingleChildScrollView` und `FittedBox`); die vielen verschachtelten Klammern übersichtlich zu halten.
