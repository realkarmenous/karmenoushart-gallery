import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/artwork.dart';
import '../theme/gallery_theme.dart';
import '../utils/format.dart';

class ArtworkDetailScreen extends StatelessWidget {
  final Artwork artwork;
  const ArtworkDetailScreen({super.key, required this.artwork});

  // Replace with your real WhatsApp number, format: countrycode+number, no + or spaces.
  static const String whatsappNumber = '2349164200997';

  Future<void> _inquireToPurchase(String itemDescription, int price) async {
    final message = Uri.encodeComponent(
      'Hi, I\'m interested in purchasing "$itemDescription" '
      '(${formatNaira(price)}) — "${artwork.title}" by ${artwork.artistAlias}.',
    );
    final url = Uri.parse('https://wa.me/$whatsappNumber?text=$message');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;

    return Scaffold(
      appBar: AppBar(title: Text(artwork.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: _ArtworkImage(artwork: artwork)),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 4,
                        child: _ArtworkInfo(
                          artwork: artwork,
                          onInquire: _inquireToPurchase,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ArtworkImage(artwork: artwork),
                      const SizedBox(height: 32),
                      _ArtworkInfo(
                        artwork: artwork,
                        onInquire: _inquireToPurchase,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _ArtworkImage extends StatelessWidget {
  final Artwork artwork;
  const _ArtworkImage({required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GalleryColors.surface,
        border: Border.all(color: GalleryColors.divider),
      ),
      child: AspectRatio(
        aspectRatio: 0.8,
        child: artwork.imageUrl.startsWith('http')
            ? Image.network(artwork.imageUrl, fit: BoxFit.cover)
            : Image.asset(artwork.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

class _ArtworkInfo extends StatelessWidget {
  final Artwork artwork;
  final Future<void> Function(String itemDescription, int price) onInquire;
  const _ArtworkInfo({required this.artwork, required this.onInquire});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(artwork.title, style: textTheme.headlineMedium),
        if (artwork.alternativeTitles.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            'Alternative titles: ${artwork.alternativeTitles.join(', ')}',
            style: textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          ),
        ],
        const SizedBox(height: 24),

        _sectionTitle(context, 'Artwork Information'),
        _infoRow('Artist', '${artwork.artistName} (${artwork.artistAlias})'),
        _infoRow('Medium', artwork.medium),
        _infoRow('Year', '${artwork.year}'),
        _infoRow('Dimensions', artwork.dimensions),

        const SizedBox(height: 24),
        _sectionTitle(context, 'Artist Statement'),
        Text(artwork.artistStatement, style: textTheme.bodyMedium),

        const SizedBox(height: 24),
        _sectionTitle(context, 'Technical Information'),
        ...artwork.technicalInfo.map(
          (line) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text('•  $line', style: textTheme.bodyMedium),
          ),
        ),

        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 16),

        _sectionTitle(context, 'Original'),
        Text(
          artwork.originalAvailable
              ? formatNaira(artwork.originalPrice)
              : 'Sold',
          style: const TextStyle(
            color: GalleryColors.accent,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        if (artwork.originalAvailable)
          ElevatedButton(
            onPressed: () => onInquire('Original', artwork.originalPrice),
            child: const Text('Inquire to Purchase Original'),
          ),

        if (artwork.prints.isNotEmpty) ...[
          const SizedBox(height: 32),
          _sectionTitle(context, 'Limited Prints'),
          Text(
            'Numbered, signed, with Certificate of Authenticity included.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          ...artwork.prints.map((edition) => _PrintRow(
                edition: edition,
                onInquire: () => onInquire(
                  '${edition.size} Print',
                  edition.price,
                ),
              )),
        ],

        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 16),
        _sectionTitle(context, 'Certificate of Authenticity'),
        Text(
          'Every purchase — original or print — includes a signed '
          'Certificate of Authenticity confirming this work was created '
          'entirely by ${artwork.artistName}.',
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: GalleryColors.accent,
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: GalleryColors.textPrimary, fontSize: 14),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class _PrintRow extends StatelessWidget {
  final PrintEdition edition;
  final VoidCallback onInquire;
  const _PrintRow({required this.edition, required this.onInquire});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(edition.size, style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: Text(
              edition.isSoldOut
                  ? 'Sold out (edition of ${edition.editionSize})'
                  : 'Edition of ${edition.editionSize} · ${edition.remaining} left',
              style: const TextStyle(color: GalleryColors.textSecondary, fontSize: 13),
            ),
          ),
          Text(formatNaira(edition.price), style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 12),
          if (!edition.isSoldOut)
            TextButton(onPressed: onInquire, child: const Text('Buy')),
        ],
      ),
    );
  }
}
