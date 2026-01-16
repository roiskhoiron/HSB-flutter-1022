import 'package:flutter/material.dart';

import 'pages/overview_page.dart';
import 'pages/trip_page.dart';
import 'pages/itinerary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = const [
    OverviewPage(),
    TripPage(),
    ItineraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.flight), label: 'Trip'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Itinerary'),
        ],
      ),
    );
  }
}
