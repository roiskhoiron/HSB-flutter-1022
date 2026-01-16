import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  String output = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trip JSON Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tombol di bawah ini akan:\n'
              '1. Membuat object Trip\n'
              '2. Mengubahnya ke JSON\n'
              '3. Mengubah JSON kembali ke object',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Membuat object Trip di memori
                final trip = Trip(
                  namaTrip: 'LIBURAN JEPANG 2026',
                  tanggalMulai: '12 Januari 2026',
                  tanggalAkhir: '28 Januari 2026',
                );

                // Mengubah object ke JSON
                final json = trip.toJson();

                // Mengubah JSON kembali ke object
                final tripFromJson = Trip.fromJson(json);

                setState(() {
                  output =
                      'JSON:\n$json\n\nObject:\n${tripFromJson.namaTrip}';
                });
              },
              child: const Text('RUN TRIP SERIALIZATION'),
            ),
            const SizedBox(height: 16),
            Text(output),
          ],
        ),
      ),
    );
  }
}
