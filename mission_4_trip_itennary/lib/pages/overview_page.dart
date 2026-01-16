import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Serialize Overview')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            Text(
              'Masalah Utama:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Komputer bekerja dengan Object di memori,\n'
              'sedangkan Internet & Database hanya menerima teks (JSON).',
            ),
            SizedBox(height: 16),
            Text(
              'Solusi:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Kita membuat Model sebagai penerjemah:\n'
              '- toJson() → Object ➜ JSON\n'
              '- fromJson() → JSON ➜ Object',
            ),
          ],
        ),
      ),
    );
  }
}
