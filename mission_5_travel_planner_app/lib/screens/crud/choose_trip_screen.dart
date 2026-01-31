import 'package:flutter/material.dart';

import '../../models/trip_model.dart';
import '../../services/trip_service.dart';

import '../../styles/app_spacing.dart';
import '../../styles/app_color.dart';

import '../../widgets/wanderly_logo.dart';
import '../../widgets/trip_item.dart';
import '../../widgets/save_button.dart';

import 'input_form_screen.dart';

class ChooseTripScreen extends StatelessWidget {
  const ChooseTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Center(child: WanderlyLogo()),
            const SizedBox(height: 32),

            // ===== LIST TRIP (PILIH LOKASI) =====
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                ),
                itemCount: TripService.allTrips.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final Trip trip = TripService.allTrips[index];

                  return TripItem(
                    title: trip.title,
                    subtitle: trip.subtitle,
                    imagePath: trip.image,
                    onTap: () async {
                      final activities =
                          await Navigator.push<Set<IconData>>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const InputFormScreen(
                            initialActivities: {},
                            isEdit: false,
                          ),
                        ),
                      );

                      if (activities != null &&
                          activities.isNotEmpty) {
                        TripService.createTrip(
                          baseTrip: trip,
                          activities: activities,
                        );

                        // kembali ke TripScreen & trigger refresh
                        Navigator.pop(context, true);
                      }
                    },
                  );
                },
              ),
            ),

            // ===== BUTTON KEMBALI =====
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: SaveButton(
                label: '← Kembali',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
