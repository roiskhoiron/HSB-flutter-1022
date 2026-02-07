import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/trip_provider.dart';

import '../../helpers/label_from_icon.dart';

import '../../widgets/wanderly_logo.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/trip_item.dart';
import '../../widgets/square_icon.dart';
import '../../widgets/save_button.dart';

import '../crud/choose_trip_screen.dart';
import '../crud/detail_trip_screen.dart';
import '../crud/input_form_screen.dart';

// Halaman utama untuk menampilkan daftar rencana perjalanan
// UI hanya bertugas menampilkan data dari Provider (tanpa setState)
class TripScreen extends ConsumerStatefulWidget {
  const TripScreen({super.key});

  @override
  ConsumerState<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends ConsumerState<TripScreen> {
  final TextEditingController _controller = TextEditingController();
  String _keyword = '';

  // Dialog konfirmasi hapus data
  // Aksi hapus dijalankan melalui Riverpod Provider
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
              ref.read(tripProvider.notifier).deleteTrip(index);
              Navigator.pop(context);

              // Notifikasi setelah data dihapus
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Rencana perjalanan dihapus')),
              );
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ambil state dari Riverpod
    final tripState = ref.watch(tripProvider);

    // Tampilkan loading saat data masih diproses
    if (tripState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Filter data berdasarkan keyword pencarian
    final filteredTrips = tripState.trips.where((trip) {
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

            // Search bar (UI state lokal, bukan data)
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

            // ===== LIST TRIP =====
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

                          // Lihat detail trip
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

                          // Edit aktivitas trip
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
                              final updatedTrip =
                                  trip.copyWithActivities(result);

                              // Update data melalui Provider
                              ref
                                  .read(tripProvider.notifier)
                                  .updateTrip(index, updatedTrip);
                            }
                          },

                          // Hapus trip
                          onDelete: () =>
                              _confirmDelete(trip.title, index),

                          // Daftar aktivitas
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

            // ===== BUTTON TAMBAH =====
            SaveButton(
              label: 'Tambah Rencana Baru',
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChooseTripScreen(),
                  ),
                );
                // Tidak perlu setState, UI akan update otomatis
              },
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
