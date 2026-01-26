import 'package:flutter/material.dart';
import '../../styles/app_color.dart';
import '../../widgets/wanderly_logo.dart';
import '../../widgets/home_indicator.dart';

// Halaman Home / Dashboard (Placeholder)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colors.background,
      body: Column(
        children: [
          const Spacer(),
          const WanderlyLogo(),
          const SizedBox(height: 16),
          const Text('Home / Dashboard Screen'),
          const Spacer(),

          // Bottom Navigation Placeholder
          Container(
            height: 60,
            color: isDark ? Colors.black : Colors.white,
            child: Column(
              children: const [
                Spacer(),
                HomeIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
