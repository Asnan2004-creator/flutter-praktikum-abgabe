// Name: Asnan Younis | Matrikelnummer: 5597668 | Studiengang: Wirtschaftsinformatik
// Übungsblatt Termin 1 – Aufgaben 1 bis 3
// Basis: die Standard-Counter-App von `flutter create`.
// Aufgabe 2: Text geändert  |  Aufgabe 3: Farbe geändert + neues UI-Element

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Termin 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Aufgabe 3 – Farbe geändert (Standard war deepPurple)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // Aufgabe 2 – Titel geändert
      home: const MyHomePage(title: 'Meine erste Flutter-App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Aufgabe 2 – Text geändert
            const Text('So oft hast du den Button gedrückt:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            // Aufgabe 3 – neues UI-Element: Button zum Zurücksetzen
            OutlinedButton.icon(
              onPressed: () => setState(() => _counter = 0),
              icon: const Icon(Icons.refresh),
              label: const Text('Zurücksetzen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Erhöhen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
