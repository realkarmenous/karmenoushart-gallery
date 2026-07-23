import "../models/artwork.dart";

final List<Artwork> sampleArtworks = [
  Artwork(
    id: "seen-bound-smiling",
    title: "Seen, Bound, Smiling",
    alternativeTitles: [
      "The Weight of Perception",
      "The Masks We Wear",
      "Bound by Many Hands",
    ],
    artistName: "Olaleye Babatunde Danel",
    artistAlias: "KarmenousHart",
    medium: "Blue Ballpoint Pen on Archival Paper",
    year: 2026,
    dimensions: "24.5 \u00d7 17.55 inches / 62.2 \u00d7 44.6 cm",
    artistStatement:
        "Seen, Bound, Smiling explores the invisible pressures that shape "
        "human identity. Multiple hands grip the figure from every direction, "
        "symbolizing society, expectations, fear, memory, relationships, and "
        "internal conflict. The rope binding the face represents the "
        "limitations we inherit and the ones we create ourselves. Despite the "
        "restraint, the subject smiles. That smile is intentionally "
        "unsettling. It asks a difficult question: how often do we hide pain "
        "behind happiness simply because the world expects us to? The "
        "exposed eye between the fingers suggests that even when our voices "
        "are restrained, part of us continues to witness, question, and seek "
        "freedom. The piece invites viewers to reflect on emotional "
        "resilience, identity, and the masks people wear to survive.",
    technicalInfo: const [
      "Medium: Blue Ballpoint Pen",
      "Surface: Acid-Free Paper",
      "Original Artwork",
      "Hand Drawn",
      "One of One (Unique Original)",
      "Signed by the Artist",
      "Comes Framed",
    ],
    originalPrice: 180000,
    prints: [
      PrintEdition(size: "A3", editionSize: 30, price: 15000),
      PrintEdition(size: "A2", editionSize: 20, price: 30000),
      PrintEdition(size: "A1", editionSize: 10, price: 60000),
    ],
    imageUrl: "assets/images/seen_bound_smiling.jpg",
  ),
  Artwork(
    id: "slow-incarnate",
    title: "Slow Incarnate",
    artistName: "Karmenous Art",
    artistAlias: "KarmenousHart",
    medium: "Blue ballpoint pen on archival paper",
    year: 2026,
    dimensions: "Original size \u2014 update with exact measurement",
    artistStatement:
        "Slow Incarnate explores the embodiment of patience in a culture "
        "driven by urgency. By merging the anatomy of a snail with human "
        "legs, the work transforms slowness from a perceived limitation "
        "into a powerful state of being. The hybrid figure is neither "
        "fully human nor entirely animal. Instead, it exists as a "
        "metaphor for the human condition, carrying burdens, memories, and "
        "aspirations while moving through life at its own rhythm. The "
        "snail\'s spiral shell symbolizes growth, continuity, and the "
        "accumulation of lived experiences, while the human legs represent "
        "persistence and the innate desire to move forward. Rather than "
        "glorifying speed, Slow Incarnate argues that true transformation "
        "often occurs gradually. It challenges viewers to reconsider the "
        "value of patience, endurance, and deliberate movement, reminding "
        "us that meaningful progress is measured not by velocity but by "
        "purpose. The work investigates patience as strength, human "
        "resilience, time and personal transformation, the tension between "
        "ambition and stillness, and identity as a continuous process of "
        "becoming.",
    technicalInfo: const [
      "Medium: Blue Ballpoint Pen",
      "Technique: Cross-hatching, stippling, and layered line work",
      "Style: Contemporary Surrealism / Figurative Art",
      "Support: Archival Paper",
      "Original Artwork",
      "Hand Drawn",
      "Signed by the Artist",
      "Comes Framed",
    ],
    originalPrice: 300000,
    prints: [
      PrintEdition(size: "A4", editionSize: 5, price: 120000),
      PrintEdition(size: "A3", editionSize: 5, price: 220000),
    ],
    imageUrl: "assets/images/slow_incanate.jpg",
  ),
];
