import '../models/artwork.dart';

// Swap these out with your real artworks. Each Artwork is one gallery piece.
// To add a new piece: copy one of these blocks, change the values, and add
// it to the list below. That's the only file you need to touch to add art.
final List<Artwork> sampleArtworks = [
  Artwork(
    id: 'seen-bound-smiling',
    title: 'Seen, Bound, Smiling',
    alternativeTitles: [
      'The Weight of Perception',
      'The Masks We Wear',
      'Bound by Many Hands',
    ],
    artistName: 'Olaleye Babatunde Danel',
    artistAlias: 'KarmenousHart',
    medium: 'Blue Ballpoint Pen on Archival Paper',
    year: 2026,
    dimensions: '24.5 × 17.55 inches / 62.2 × 44.6 cm',
    artistStatement:
        'Seen, Bound, Smiling explores the invisible pressures that shape '
        'human identity. Multiple hands grip the figure from every direction, '
        'symbolizing society, expectations, fear, memory, relationships, and '
        'internal conflict. The rope binding the face represents the '
        'limitations we inherit and the ones we create ourselves. Despite the '
        'restraint, the subject smiles. That smile is intentionally '
        'unsettling. It asks a difficult question: how often do we hide pain '
        'behind happiness simply because the world expects us to? The '
        'exposed eye between the fingers suggests that even when our voices '
        'are restrained, part of us continues to witness, question, and seek '
        'freedom. The piece invites viewers to reflect on emotional '
        'resilience, identity, and the masks people wear to survive.',
    technicalInfo: const [
      'Medium: Blue Ballpoint Pen',
      'Surface: Acid-Free Paper',
      'Original Artwork',
      'Hand Drawn',
      'One of One (Unique Original)',
      'Signed by the Artist',
      'Comes Framed',
    ],
    originalPrice: 180000,
    prints: [
      PrintEdition(size: 'A3', editionSize: 30, price: 15000),
      PrintEdition(size: 'A2', editionSize: 20, price: 30000),
      PrintEdition(size: 'A1', editionSize: 10, price: 60000),
    ],
    imageUrl: 'assets/images/seen_bound_smiling.jpg',
  ),


   Artwork(
    id: 'slow-incanate',
    title: 'Slow Incanate',
    alternativeTitles: [
      'The Weight of Perception',
      'The Masks We Wear',
      'Bound by Many Hands',
    ],
    artistName: 'Olaleye Babatunde Danel',
    artistAlias: 'KarmenousHart',
    medium: 'Blue Ballpoint Pen on Archival Paper',
    year: 2026,
    dimensions: '24.5 × 17.55 inches / 62.2 × 44.6 cm',
    artistStatement:
        'Slow Incanate explores the invisible pressures that shape '
        'human identity. Multiple hands grip the figure from every direction, '
        'symbolizing society, expectations, fear, memory, relationships, and '
        'internal conflict. The rope binding the face represents the '
        'limitations we inherit and the ones we create ourselves. Despite the '
        'restraint, the subject smiles. That smile is intentionally '
        'unsettling. It asks a difficult question: how often do we hide pain '
        'behind happiness simply because the world expects us to? The '
        'exposed eye between the fingers suggests that even when our voices '
        'are restrained, part of us continues to witness, question, and seek '
        'freedom. The piece invites viewers to reflect on emotional '
        'resilience, identity, and the masks people wear to survive.',
    technicalInfo: const [
      'Medium: Blue Ballpoint Pen',
      'Surface: Acid-Free Paper',
      'Original Artwork',
      'Hand Drawn',
      'One of One (Unique Original)',
      'Signed by the Artist',
      'Comes Framed',
    ],
    originalPrice: 180000,
    prints: [
      PrintEdition(size: 'A3', editionSize: 30, price: 15000),
      PrintEdition(size: 'A2', editionSize: 20, price: 30000),
      PrintEdition(size: 'A1', editionSize: 10, price: 60000),
    ],
    imageUrl: 'assets/images/slow_incanate.jpg',
  ),
];
