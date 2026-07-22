import 'package:flutter/material.dart';
import '../data/sample_artworks.dart';
import '../models/artwork.dart';
import '../theme/gallery_theme.dart';
import '../utils/format.dart';
import '../widgets/social_icons_row.dart';
import '../widgets/work_with_me_bar.dart';
import 'artwork_detail_screen.dart';
import 'portfolio_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Web layout: more columns on wide screens, fewer on mobile.
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1100 ? 3 : (width > 650 ? 2 : 1);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: const [
            Expanded(
              child: Text(
                'KARMENOUSHART',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, letterSpacing: 3, fontWeight: FontWeight.w700),
              ),
            ),
            SocialIconsRow(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          itemCount: sampleArtworks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final artwork = sampleArtworks[index];
            return _ArtworkCard(artwork: artwork);
          },
        ),
      ),
      bottomNavigationBar: WorkWithMeBar(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PortfolioScreen()),
          );
        },
      ),
    );
  }
}

class _ArtworkCard extends StatelessWidget {
  final Artwork artwork;
  const _ArtworkCard({required this.artwork});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArtworkDetailScreen(artwork: artwork),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: GalleryColors.surface,
                border: Border.all(color: GalleryColors.divider),
              ),
              child: artwork.imageUrl.startsWith('http')
                  ? Image.network(artwork.imageUrl, fit: BoxFit.cover)
                  : Image.asset(artwork.imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            artwork.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            '${artwork.medium} \u00b7 ${artwork.year}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            artwork.originalAvailable
                ? formatNaira(artwork.originalPrice)
                : 'Original sold \u2014 prints available',
            style: const TextStyle(
              color: GalleryColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}