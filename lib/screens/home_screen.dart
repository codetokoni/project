import 'package:flutter/material.dart';

import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _featuredContent = [
    _ContentItem(
      title: 'Welcome to FALF TV',
      duration: '30:00',
      imageUrl: 'https://falfpullzone.b-cdn.net/FALA/assets/PROJECT-AFRICA.jpg',
    ),
    _ContentItem(
      title: 'African Leadership Summit',
      duration: '40:00',
      imageUrl: 'https://falfpullzone.b-cdn.net/FALA/assets/round_table.jpg',
    ),
    _ContentItem(
      title: 'FALF News: Leadership Summit 2025',
      duration: '20:00',
      imageUrl: 'https://falfpullzone.b-cdn.net/FALA/assets/FALF-NEWS.jpg',
    ),
    _ContentItem(
      title: 'FALF News: Youth Empowerment Program Launch',
      duration: '16:20',
      imageUrl: 'https://falfpullzone.b-cdn.net/FALA/assets/FALF-NEWS.jpg',
    ),
    _ContentItem(
      title: 'FALF News: Community Impact Report',
      duration: '26:00',
      imageUrl: 'https://falfpullzone.b-cdn.net/FALA/assets/FALA-EXPERIENCE.jpg',
    ),
    _ContentItem(
      title: 'FALF News: Education Partnership Announcement',
      duration: '18:00',
      imageUrl: 'https://falfpullzone.b-cdn.net/FALA/assets/spotlight.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildHeroBanner(context),
        _buildSectionTitle(context, 'Featured Content'),
        _buildContentGrid(context, _featuredContent),
        _buildSectionTitle(context, 'Trending Now'),
        _buildContentGrid(context, _featuredContent.reversed.toList()),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      height: 340,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://falfpullzone.b-cdn.net/FALA/assets/PROJECT-AFRICA.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Colors.black.withValues(alpha: 0.4),
              Colors.black.withValues(alpha: 0.75),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FALF TV',
              style: TextStyle(
                color: kGold,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 12),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.white, kGold],
              ).createShader(bounds),
              child: const Text(
                'Experience Africa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Authentic Stories. Real Voices.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withValues(alpha: 0.9),
                letterSpacing: 1,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text(
                'Watch Now',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: kGold,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentGrid(BuildContext context, List<_ContentItem> items) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: items.length,
        itemBuilder: (context, index) => _buildContentCard(context, items[index]),
      ),
    );
  }

  Widget _buildContentCard(BuildContext context, _ContentItem item) {
    return Container(
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.network(
                  item.imageUrl,
                  height: 130,
                  width: 170,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    height: 130,
                    width: 170,
                    color: kSurfaceDark,
                    child: const Icon(Icons.movie, color: Colors.white24, size: 40),
                  ),
                ),
                // Dark gradient overlay at bottom
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.5),
                        ],
                      ),
                    ),
                  ),
                ),
                // Duration badge
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      item.duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // Play icon overlay
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kGold.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentItem {
  final String title;
  final String duration;
  final String imageUrl;

  const _ContentItem({
    required this.title,
    required this.duration,
    required this.imageUrl,
  });
}
