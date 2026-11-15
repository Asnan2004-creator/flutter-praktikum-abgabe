// Name: Asnan Younis | Matrikelnummer: 5597668 | Studiengang: Wirtschaftsinformatik
// Übungsblatt Termin 2 – Dart Grundlagen (Aufgaben 1 bis 8)
// Ausführen mit:  dart run aufgaben.dart

// Aufgabe 7 – Funktion, die eine Zahl verdoppelt
int verdoppeln(int zahl) => zahl * 2;

void main() {
  // ---------- Level 1 – Warm-Up ----------

  // Aufgabe 1 – Name und Alter formatiert ausgeben
  String name = 'Asnan Younis';
  int alter = 22;
  print('--- Aufgabe 1 ---');
  print('Name:  $name');
  print('Alter: $alter Jahre');

  // Aufgabe 2 – Summe von zwei Zahlen
  int zahl1 = 15;
  int zahl2 = 27;
  print('--- Aufgabe 2 ---');
  print('$zahl1 + $zahl2 = ${zahl1 + zahl2}');

  // ---------- Level 2 – Logik ----------

  // Aufgabe 3 – Gerade oder ungerade?
  int pruefZahl = 13;
  print('--- Aufgabe 3 ---');
  if (pruefZahl % 2 == 0) {
    print('$pruefZahl ist gerade.');
  } else {
    print('$pruefZahl ist ungerade.');
  }

  // Aufgabe 4 – Größere von zwei Zahlen
  int x = 42;
  int y = 17;
  print('--- Aufgabe 4 ---');
  if (x > y) {
    print('Die größere Zahl ist $x.');
  } else if (y > x) {
    print('Die größere Zahl ist $y.');
  } else {
    print('Beide Zahlen sind gleich groß ($x).');
  }

  // Aufgabe 5 – Zahlen 1 bis 10 mit Schleife
  print('--- Aufgabe 5 ---');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // ---------- Level 3 – Denken ----------

  // Aufgabe 6 – Summe von 1 bis 100
  int summe = 0;
  for (int i = 1; i <= 100; i++) {
    summe += i;
  }
  print('--- Aufgabe 6 ---');
  print('Summe von 1 bis 100 = $summe'); // 5050

  // Aufgabe 7 – Funktion verwenden
  print('--- Aufgabe 7 ---');
  int wert = 21;
  print('$wert verdoppelt ist ${verdoppeln(wert)}.');

  // Aufgabe 8 – Liste mit Zahlen ausgeben
  List<int> zahlen = [3, 8, 15, 23, 42];
  print('--- Aufgabe 8 ---');
  for (int z in zahlen) {
    print(z);
  }
}
