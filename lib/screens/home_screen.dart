import 'package:flutter/material.dart';

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
      children: [
        _buildHeroBanner(context),
        _buildSectionTitle(context, 'Featured Content'),
        _buildContentRow(_featuredContent),
        _buildSectionTitle(context, 'Trending Now'),
        _buildContentRow(_featuredContent.reversed.toList()),
      ],
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      height: 220,
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
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.8),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experience Africa',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Authentic Stories. Real Voices.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text('Watch Now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildContentRow(List<_ContentItem> items) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildContentCard(context, item);
        },
      ),
    );
  }

  Widget _buildContentCard(BuildContext context, _ContentItem item) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.network(
                  item.imageUrl,
                  height: 100,
                  width: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    height: 100,
                    width: 160,
                    color: Colors.grey.shade800,
                    child: const Icon(Icons.movie, color: Colors.white54, size: 40),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      item.duration,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
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
