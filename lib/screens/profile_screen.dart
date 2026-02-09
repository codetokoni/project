import 'package:flutter/material.dart';

import '../main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      children: [
        const SizedBox(height: 16),
        // Logo area
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kGold,
                kGold.withValues(alpha: 0.6),
              ],
            ),
          ),
          child: const Icon(Icons.tv, size: 48, color: Colors.black),
        ),
        const SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, kGold],
          ).createShader(bounds),
          child: const Text(
            'FALF TV',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Your premier destination for authentic African content',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.7),
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 32),
        // About card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kCardDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kGold.withValues(alpha: 0.15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.info_outline, color: kGold, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Experience African Stories \u2014 Your premier destination for '
                'authentic African content, documentaries, music, culture, '
                'and live events.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 14,
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Contact card
        Container(
          decoration: BoxDecoration(
            color: kCardDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kGold.withValues(alpha: 0.15),
            ),
          ),
          child: Column(
            children: [
              _buildContactTile(
                icon: Icons.email_outlined,
                title: 'Contact',
                subtitle: 'admin@falftv.com',
              ),
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
              _buildContactTile(
                icon: Icons.language,
                title: 'Website',
                subtitle: 'www.falf.tv',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Social card
        Container(
          decoration: BoxDecoration(
            color: kCardDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kGold.withValues(alpha: 0.15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Row(
                  children: [
                    Icon(Icons.people_outline, color: kGold, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Follow Us',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              _buildSocialTile(Icons.facebook, 'Facebook'),
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
              _buildSocialTile(Icons.alternate_email, 'Twitter'),
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
              _buildSocialTile(Icons.camera_alt_outlined, 'Instagram'),
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
              _buildSocialTile(Icons.play_circle_outline, 'YouTube'),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '\u00a9 2026 FALF TV. All Rights Reserved.\nDesigned with \u2764 for Africa',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withValues(alpha: 0.4),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: kGold.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: kGold, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
          fontSize: 13,
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildSocialTile(IconData icon, String name) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      leading: Icon(icon, color: kGold, size: 22),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      trailing: Icon(
        Icons.open_in_new,
        size: 16,
        color: Colors.white.withValues(alpha: 0.4),
      ),
      onTap: () {},
    );
  }
}
