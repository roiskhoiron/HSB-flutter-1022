import 'package:flutter/material.dart';
import '../models/trip_model.dart';

class TripService {
  // ===== DATA UNTUK SEARCH =====
  static List<Trip> allTrips = [
    Trip(
      title: 'Dramatic limestone island',
      subtitle: 'Halong Bay, Vietnam',
      image: 'assets/image/search/halong_bay.png',
    ),
    Trip(
      title: 'The Iconic White and Blue',
      subtitle: 'Santorini, Greece',
      image: 'assets/image/search/santorini.png',
    ),
    Trip(
      title: 'Iconic Urban Energy',
      subtitle: 'New York, USA',
      image: 'assets/image/search/new_york.png',
    ),
    Trip(
      title: 'Nature, Culture and Beach',
      subtitle: 'Bali, Indonesia',
      image: 'assets/image/search/bali.png',
    ),
    Trip(
      title: 'Golden Pavilion',
      subtitle: 'Kyoto, Japan',
      image: 'assets/image/search/kyoto.png',
    ),
  ];

  // ===== DATA UNTUK TRIP (SAVED) =====
  static List<Trip> savedTrips = [
    Trip(
      title: 'Dramatic limestone island',
      subtitle: 'Halong Bay, Vietnam',
      image: 'assets/image/search/halong_bay.png',
      activities: {
        Icons.camera_alt,
        Icons.restaurant,
      },
    ),
    Trip(
      title: 'The Iconic White and Blue',
      subtitle: 'Santorini, Greece',
      image: 'assets/image/search/santorini.png',
      activities: {
        Icons.camera_alt,
        Icons.hotel,
      },
    ),
  ];
}
