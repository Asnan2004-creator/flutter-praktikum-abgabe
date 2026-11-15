// Name: Asnan Younis | Matrikelnummer: 5597668 | Studiengang: Wirtschaftsinformatik
// Praktikum Termin 3 – Flutter UI Einstieg
// Eine App, in der jede Aufgabe (1–8) eine eigene Seite ist.
// Auf der Startseite wählt man die Aufgabe aus.

import 'package:flutter/material.dart';

void main() {
  runApp(const PraktikumApp());
}

// Aufgabe 7 – Farben & Styling: zentrales Theme für die ganze App
class PraktikumApp extends StatelessWidget {
  const PraktikumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Praktikum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      home: const StartSeite(),
    );
  }
}

// ---------------------------------------------------------------------------
// Startseite: Liste aller Aufgaben
// ---------------------------------------------------------------------------
class StartSeite extends StatelessWidget {
  const StartSeite({super.key});

  @override
  Widget build(BuildContext context) {
    final aufgaben = <(String, Widget)>[
      ('Aufgabe 1 – Erste Oberfläche', const Aufgabe1ErsteOberflaeche()),
      ('Aufgabe 2 – Profilseite', const Aufgabe2Profil()),
      ('Aufgabe 3 – Row & Column', const Aufgabe3Layout()),
      ('Aufgabe 4 – Cards', const Aufgabe4Cards()),
      ('Aufgabe 5 – Buttons & Aktionen', const Aufgabe5Buttons()),
      ('Aufgabe 6 – Counter App', const Aufgabe6Counter()),
      ('Aufgabe 7 – Farben & Styling', const Aufgabe7Styling()),
      ('Aufgabe 8 – Bonus: Dashboard', const Aufgabe8Dashboard()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Termin 3 – Flutter UI'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: aufgaben.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final (titel, seite) = aufgaben[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text(titel),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => seite),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 1 – Erste Oberfläche: zentrierter Text
// ---------------------------------------------------------------------------
class Aufgabe1ErsteOberflaeche extends StatelessWidget {
  const Aufgabe1ErsteOberflaeche({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aufgabe 1')),
      body: const Center(
        child: Text('Willkommen zu Flutter UI', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 2 – Profilseite
// ---------------------------------------------------------------------------
class Aufgabe2Profil extends StatelessWidget {
  const Aufgabe2Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aufgabe 2 – Profil')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profilbild (Icon genügt)
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 60),
              ),
              const SizedBox(height: 16),
              // Name
              Text(
                'Asnan Younis',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              // Studiengang
              const Text(
                'Studiengang: Wirtschaftsinformatik',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Text(
                'Matrikelnummer: 5597668',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Kurzer Beschreibungstext
              const Text(
                'Ich lerne gerade Flutter und Dart und baue meine ersten '
                'eigenen Apps.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 3 – Layout mit Row und Column
// ---------------------------------------------------------------------------
class Aufgabe3Layout extends StatelessWidget {
  const Aufgabe3Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aufgabe 3 – Layout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Oben: Titel
            Text(
              'Mein Layout',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            // Darunter: zwei Boxen nebeneinander
            Row(
              children: [
                Expanded(child: _box(Colors.orange, 'Box 1')),
                const SizedBox(width: 16),
                Expanded(child: _box(Colors.teal, 'Box 2')),
              ],
            ),
            const SizedBox(height: 16),
            // Darunter: ein Button
            ElevatedButton(
              onPressed: () => debugPrint('Button in Aufgabe 3 gedrückt'),
              child: const Text('Klick mich'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(Color farbe, String text) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: farbe,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 4 – Drei Cards untereinander
// ---------------------------------------------------------------------------
class Aufgabe4Cards extends StatelessWidget {
  const Aufgabe4Cards({super.key});

  @override
  Widget build(BuildContext context) {
    const inhalte = [
      ('Flutter', 'Ein UI-Framework von Google für mehrere Plattformen.'),
      (
        'Dart',
        'Die Programmiersprache, in der Flutter-Apps geschrieben werden.',
      ),
      ('Widgets', 'In Flutter ist alles ein Widget – auch Layouts.'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Aufgabe 4 – Cards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final (titel, text) in inhalte)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titel, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(text),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 5 – Buttons & Aktionen (Konsolenausgabe)
// ---------------------------------------------------------------------------
class Aufgabe5Buttons extends StatelessWidget {
  const Aufgabe5Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aufgabe 5 – Buttons')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => debugPrint('Like gedrückt'),
              icon: const Icon(Icons.thumb_up),
              label: const Text('Like'),
            ),
            const SizedBox(width: 16),
            OutlinedButton.icon(
              onPressed: () => debugPrint('Reset gedrückt'),
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 6 – Counter App mit setState()
// ---------------------------------------------------------------------------
class Aufgabe6Counter extends StatefulWidget {
  const Aufgabe6Counter({super.key});

  @override
  State<Aufgabe6Counter> createState() => _Aufgabe6CounterState();
}

class _Aufgabe6CounterState extends State<Aufgabe6Counter> {
  int _zaehler = 0;

  void _erhoehen() {
    setState(() {
      _zaehler++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aufgabe 6 – Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Du hast so oft gedrückt:'),
            Text('$_zaehler', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _erhoehen, child: const Text('+1')),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 7 – Farben & Styling (Farben, große Überschriften, Abstände)
// ---------------------------------------------------------------------------
class Aufgabe7Styling extends StatelessWidget {
  const Aufgabe7Styling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        title: const Text('Aufgabe 7 – Styling'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView: auf kleinen Bildschirmen kann man scrollen,
      // statt dass der Inhalt unten abgeschnitten wird.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Große Überschrift',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.pinkAccent],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Farben, Abstände und abgerundete Ecken machen die App '
                'übersichtlicher und schöner.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Zwischenüberschrift',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text('Normaler Text mit etwas Abstand nach oben.'),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Aufgabe 8 – Bonus: Dashboard mit AppBar, 4 Kacheln, Icons, Buttons
// ---------------------------------------------------------------------------
class Aufgabe8Dashboard extends StatelessWidget {
  const Aufgabe8Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const kacheln = [
      ('Nachrichten', Icons.mail, Colors.blue),
      ('Kalender', Icons.calendar_month, Colors.green),
      ('Aufgaben', Icons.check_circle, Colors.orange),
      ('Einstellungen', Icons.settings, Colors.purple),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => debugPrint('Benachrichtigungen'),
          ),
        ],
      ),
      // Center + ConstrainedBox: auf breiten Bildschirmen (z. B. im Browser)
      // bleiben die Kacheln handlich statt riesig zu werden.
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: GridView.count(
            crossAxisCount: 2, // 2 Spalten -> 4 Kacheln als 2x2-Raster
            childAspectRatio: 0.85, // etwas höher als breit, damit alles passt
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              for (final (titel, icon, farbe) in kacheln)
                Card(
                  color: farbe.shade100, // helle Variante der Kachelfarbe
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    // FittedBox verkleinert den Inhalt, falls eine Kachel
                    // einmal zu klein dafür ist (z. B. auf schmalen Handys).
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(icon, size: 48, color: farbe),
                          const SizedBox(height: 8),
                          Text(
                            titel,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          FilledButton(
                            onPressed: () => debugPrint('$titel geöffnet'),
                            child: const Text('Öffnen'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
