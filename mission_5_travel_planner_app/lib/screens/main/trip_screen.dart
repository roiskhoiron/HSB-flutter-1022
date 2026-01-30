import 'package:flutter/material.dart';

import '../../helpers/label_from_icon.dart';

import '../../widgets/wanderly_logo.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/trip_item.dart';
import '../../widgets/square_icon.dart';
import '../../widgets/save_button.dart';

import '../crud/input_form_screen.dart';
import '../crud/detail_trip_screen.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final TextEditingController _controller = TextEditingController();
  String _keyword = '';

  final List<Map<String, dynamic>> _trips = [
    {
      'title': 'Dramatic limestone island',
      'subtitle': 'Halong Bay, Vietnam',
      'image': 'assets/image/search/halong_bay.png',
      'activities': <IconData>{
        Icons.camera_alt,
        Icons.restaurant,
      },
    },
    {
      'title': 'The Iconic White and Blue',
      'subtitle': 'Santorini, Greece',
      'image': 'assets/image/search/santorini.png',
      'activities': <IconData>{
        Icons.camera_alt,
        Icons.hotel,
      },
    },
  ];

  void _confirmDelete(String title, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: Text(
          'Kamu yakin ingin menghapus rencana perjalanan ke "$title"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _trips.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  Future<void> _createTrip() async {
    final result = await Navigator.push<Set<IconData>>(
      context,
      MaterialPageRoute(
        builder: (_) => const InputFormScreen(
          initialActivities: {},
          isEdit: false,
        ),
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _trips.add({
          'title': 'New Trip',
          'subtitle': 'Custom location',
          'image': 'assets/image/search/halong_bay.png',
          'activities': result,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredTrips = _trips.where((trip) {
      final q = _keyword.toLowerCase();
      return trip['title'].toLowerCase().contains(q) ||
          trip['subtitle'].toLowerCase().contains(q);
    }).toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Center(child: WanderlyLogo()),
                const SizedBox(height: 32),

                WanderlySearchBar(
                  controller: _controller,
                  placeholder: 'Search your saved destination',
                  onChanged: (value) {
                    setState(() {
                      _keyword = value;
                    });
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredTrips.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final trip = filteredTrips[index];

                return TripItem(
                  title: trip['title'],
                  subtitle: trip['subtitle'],
                  imagePath: trip['image'],
                  showActions: true,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailTripScreen(
                          title: trip['title'],
                          subtitle: trip['subtitle'],
                          imagePath: trip['image'],
                        ),
                      ),
                    );
                  },

                  onEdit: () async {
                    final result = await Navigator.push<Set<IconData>>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InputFormScreen(
                          initialActivities:
                              Set<IconData>.from(trip['activities']),
                          isEdit: true,
                        ),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        trip['activities'] = result;
                      });
                    }
                  },

                  onDelete: () {
                    _confirmDelete(trip['title'], index);
                  },

                  bottomWidget: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        for (final icon in trip['activities'])
                          SquareIcon(
                            icon: icon,
                            label: labelFromIcon(icon),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ===== TOMBOL TAMBAH AKTIVITAS =====
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SaveButton(
              label: 'Tambah Aktivitas',
              onPressed: _createTrip,
            ),
          ),
        ],
      ),
    );
  }
}
