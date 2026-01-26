import 'package:flutter/material.dart';
import '../../styles/app_color.dart';
import '../../widgets/wanderly_logo.dart';
import '../../widgets/home_indicator.dart';
import '../../main.dart';

// Halaman Profile (Placeholder + Toggle Theme)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final theme = ThemeController.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: Column(
        children: [
          const Spacer(),

          const WanderlyLogo(),
          const SizedBox(height: 16),
          const Text('Profile Screen'),

          const SizedBox(height: 24),

          // Toggle Dark / Light Mode
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: theme.isDark,
            onChanged: (value) {
              // Atur dark mode pada aplikasi
              theme.toggleTheme(value);
            },
          ),

          const Spacer(),

          const HomeIndicator(),
        ],
      ),
    );
  }
}
