import 'package:flutter_riverpod/legacy.dart';

import '../models/trip_model.dart';
import '../services/trip_service.dart';

// State Trip (list + loading)
class TripState {
  final List<Trip> trips;
  final bool isLoading;

  TripState({
    required this.trips,
    required this.isLoading,
  });

  TripState copyWith({
    List<Trip>? trips,
    bool? isLoading,
  }) {
    return TripState(
      trips: trips ?? this.trips,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// StateNotifier untuk mengelola CRUD Trip
class TripNotifier extends StateNotifier<TripState> {
  TripNotifier()
      : super(TripState(trips: [], isLoading: true)) {
    loadTrips();
  }

  // Load awal dari Hive
  void loadTrips() {
    final data = TripService.loadTrips();
    state = state.copyWith(trips: data, isLoading: false);
  }

  // Tambah trip
  void addTrip(Trip trip) {
    TripService.addTrip(trip);
    loadTrips();
  }

  // Update trip
  void updateTrip(int index, Trip updatedTrip) {
    TripService.updateTrip(index, updatedTrip);
    loadTrips();
  }

  // Hapus trip
  void deleteTrip(int index) {
    TripService.deleteTrip(index);
    loadTrips();
  }
}

// Provider global
final tripProvider =
    StateNotifierProvider<TripNotifier, TripState>((ref) {
  return TripNotifier();
});
