// Name: Asnan Younis | Matrikelnummer: 5597668 | Studiengang: Wirtschaftsinformatik
// Übungsblatt Termin 2 – Bonus: Ratespiel (Zahl zwischen 1 und 10)
// Ausführen im Terminal mit:  dart run bonus_ratespiel.dart

import 'dart:io';
import 'dart:math';

void main() {
  final geheimeZahl = Random().nextInt(10) + 1; // 1 bis 10
  int versuche = 0;

  print('Ich denke mir eine Zahl zwischen 1 und 10. Rate mal!');

  while (true) {
    stdout.write('Dein Tipp: ');
    final eingabe = stdin.readLineSync();

    // Programm beenden, wenn keine Eingabe mehr kommt
    if (eingabe == null) {
      print('\nSpiel beendet. Die Zahl war $geheimeZahl.');
      return;
    }

    final tipp = int.tryParse(eingabe.trim());
    if (tipp == null || tipp < 1 || tipp > 10) {
      print('Bitte gib eine ganze Zahl zwischen 1 und 10 ein.');
      continue;
    }

    versuche++;

    if (tipp < geheimeZahl) {
      print('Zu klein!');
    } else if (tipp > geheimeZahl) {
      print('Zu groß!');
    } else {
      print(
        'Richtig! Die Zahl war $geheimeZahl. '
        'Du hast $versuche Versuch(e) gebraucht.',
      );
      return;
    }
  }
}
