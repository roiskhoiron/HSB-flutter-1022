import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 438,
        minHeight: 467,
      ),
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== LOGO =====
          Image.asset(
            'assets/image/auth/wanderly_logo.png',
            width: 170,
            height: 116,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 16),

          // ===== TAGLINE =====
          const Text(
            'Enjoy your trip with glorious serve from harijumat.co!',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 16),

          // ===== ALAMAT =====
          const Text(
            'Jl. Raya Pajajaran No.88, Kel. Tanah Sareal, '
            'Kec. Bogor Tengah, Kota Bogor, Jawa Barat, 16127, Indonesia',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 8),

          // ===== TELP =====
          const Text(
            '+62-891827-23293',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 24),

          // ===== PERUSAHAAN =====
          _FooterLink(title: 'Perusahaan'),

          const SizedBox(height: 12),

          // ===== KOMUNITAS =====
          _FooterLink(title: 'Komunitas'),

          const SizedBox(height: 16),

          // ===== DIVIDER =====
          Center(
            child: Container(
              width: 371,
              height: 1,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 24),

          // ===== SOSMED =====
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              _SocialIcon(icon: Icons.work),
              SizedBox(width: 16),
              _SocialIcon(icon: Icons.camera_alt), // Instagram placeholder
              SizedBox(width: 16),
              _SocialIcon(icon: Icons.close), // Twitter/X placeholder
              SizedBox(width: 16),
              _SocialIcon(icon: Icons.facebook),
            ],
          ),

          const SizedBox(height: 32),

          // ===== COPYRIGHT =====
          const Text(
            '@2026 Kwetiau Siram All Rights Reserved',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// SUB WIDGETS

class _FooterLink extends StatelessWidget {
  final String title;

  const _FooterLink({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black,
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white,
      ),
      child: Icon(
        icon,
        color: Colors.black,
        size: 28,
      ),
    );
  }
}
