import 'package:flutter/material.dart';

class Trip {
  final String title;
  final String subtitle;
  final String image;
  Set<IconData> activities;

  Trip({
    required this.title,
    required this.subtitle,
    required this.image,
    Set<IconData>? activities,
  }) : activities = activities ?? {};
}
