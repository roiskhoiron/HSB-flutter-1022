import 'package:flutter/material.dart';

import '../../models/trip_model.dart';
import '../../services/trip_service.dart';

import '../../helpers/label_from_icon.dart';

import '../../widgets/wanderly_logo.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/trip_item.dart';
import '../../widgets/square_icon.dart';
import '../../widgets/save_button.dart';

import '../crud/input_form_screen.dart';
import '../crud/choose_trip_screen.dart';
import '../crud/detail_trip_screen.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final TextEditingController _controller = TextEditingController();
  String _keyword = '';

  List<Trip> get _trips => TripService.savedTrips;

  void _confirmDelete(String title, int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: Text('Hapus rencana perjalanan ke "$title"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              setState(() => TripService.deleteTrip(index));
              Navigator.pop(context);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTrips = _trips.where((trip) {
      final q = _keyword.toLowerCase();
      return trip.title.toLowerCase().contains(q) ||
          trip.subtitle.toLowerCase().contains(q);
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // ===== HEADER =====
            const SizedBox(height: 16),
            const Center(child: WanderlyLogo()),
            const SizedBox(height: 32),

            WanderlySearchBar(
              controller: _controller,
              placeholder: 'Search your saved destination',
              onChanged: (value) {
                setState(() => _keyword = value);
              },
            ),

            const SizedBox(height: 24),

            // ===== LIST =====
            Expanded(
              child: filteredTrips.isEmpty
                  ? ListView(
                      children: const [
                        SizedBox(height: 8),
                        TripItem(
                          title: 'Belum ada rencana perjalanan...',
                          subtitle:
                              'Klik button di bawah untuk menambahkan rencana liburan baru.',
                          leadingIcon: Icons.flight_takeoff,
                        ),
                      ],
                    )
                  : ListView.separated(
                      itemCount: filteredTrips.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final trip = filteredTrips[index];

                        return TripItem(
                          title: trip.title,
                          subtitle: trip.subtitle,
                          imagePath: trip.image,
                          showActions: true,

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailTripScreen(
                                  title: trip.title,
                                  subtitle: trip.subtitle,
                                  imagePath: trip.image,
                                ),
                              ),
                            );
                          },

                          onEdit: () async {
                            final result =
                                await Navigator.push<Set<IconData>>(
                              context,
                              MaterialPageRoute(
                                builder: (_) => InputFormScreen(
                                  initialActivities: trip.activities,
                                  isEdit: true,
                                ),
                              ),
                            );

                            if (result != null) {
                              setState(() {
                                TripService.updateActivities(index, result);
                              });
                            }
                          },

                          onDelete: () =>
                              _confirmDelete(trip.title, index),

                          bottomWidget: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                for (final icon in trip.activities)
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

            const SizedBox(height: 12),

            // ===== BUTTON =====
            SaveButton(
              label: 'Tambah Rencana Baru',
              onPressed: () async {
                final result = await Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChooseTripScreen(),
                  ),
                );

                if (result == true) {
                  setState(() {});
                }
              },
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
