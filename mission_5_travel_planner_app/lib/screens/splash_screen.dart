import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // Logo Wanderly
            Image.asset(
              'assets/image/auth/wanderly_logo.png',
              width: 297,
              height: 198,
            ),

            const Spacer(),

            // Kotak utama splash
            Container(
              width: double.infinity,
              height: 355,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(69),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text slogan
                  Text(
                    'Explore the world effortlessly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Icon Arrow
                  IconButton(
                    icon: Icon(
                      Icons.arrow_circle_right,
                      size: 40,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      // Navigasi ke Login Screen
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.login,
                      );
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Home Indicator
            Container(
              height: 34,
              width: double.infinity,
              color: const Color(0xFF2F4BB9),
              alignment: Alignment.center,
              child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
