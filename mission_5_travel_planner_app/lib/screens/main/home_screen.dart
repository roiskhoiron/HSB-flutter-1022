import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 64),

          Image.asset(
            'assets/image/auth/wanderly_logo.png',
            width: 297,
            height: 198,
          ),

          const SizedBox(height: 16),

          Text(
            'Home/Dashboard Screen',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 18,
            ),
          ),

          const Spacer(),

          // Bottom Navigation Placeholder
          Container(
            height: 70,
            width: double.infinity,
            color: isDark ? Colors.black : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, color: Color(0xFF2F4BB9)),
                    Icon(Icons.search, color: Color(0xFF2F4BB9)),
                    Icon(Icons.map, color: Color(0xFF2F4BB9)),
                    Icon(Icons.person, color: Color(0xFF2F4BB9)),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: 134,
                  height: 5,
                  color: const Color(0xFF2F4BB9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
