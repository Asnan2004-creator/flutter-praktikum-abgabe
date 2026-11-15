// Name: Asnan Younis | Matrikelnummer: 5597668 | Studiengang: Wirtschaftsinformatik
// Übungsblatt Termin 1 – Aufgaben 4 bis 6 (Dart)
// Ausführen mit:  dart run aufgaben.dart

// Aufgabe 5 – Funktion, die eine Zahl verdoppelt
int verdoppeln(int zahl) {
  return zahl * 2;
}

void main() {
  // Aufgabe 4 – Name und Alter ausgeben
  String name = 'Asnan Younis';
  int alter = 22;
  print('Aufgabe 4: Ich heiße $name und bin $alter Jahre alt.');

  // Aufgabe 5 – Funktion verwenden
  int zahl = 7;
  print('Aufgabe 5: $zahl verdoppelt ist ${verdoppeln(zahl)}.');

  // Aufgabe 6 – Mini-Challenge: zwei Zahlen addieren
  int a = 12;
  int b = 30;
  int summe = a + b;
  print('Aufgabe 6: $a + $b = $summe');
}
