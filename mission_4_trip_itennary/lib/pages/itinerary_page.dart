import 'package:flutter/material.dart';
import '../models/itinerary_item.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  String output = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Itinerary JSON Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tombol ini akan menyimpan rencana itinerary\n'
              'ke format JSON lalu mengubahnya kembali.',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final item = ItineraryItem(
                  lokasi: 'KYOTO',
                  waktu: 'JAM 8 MALAM',
                  catatan: 'Coba ramen ichiraku dekat rumah Masashi Kishimoto',
                  idTrip: '1022',
                );

                final json = item.toJson();
                final itemFromJson = ItineraryItem.fromJson(json);

                setState(() {
                  output =
                      'JSON:\n$json\n\nObject:\n${itemFromJson.lokasi}';
                });
              },
              child: const Text('RUN ITINERARY SERIALIZATION'),
            ),
            const SizedBox(height: 16),
            Text(output),
          ],
        ),
      ),
    );
  }
}
