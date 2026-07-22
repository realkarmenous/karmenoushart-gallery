// A single print edition size (e.g. A3, A2, A1) with its own price and run size.
class PrintEdition {
  final String size; // e.g. "A3"
  final int editionSize; // total number of prints available in this size, e.g. 30
  final int price; // in Naira
  int numberSold; // how many of this edition have been sold so far

  PrintEdition({
    required this.size,
    required this.editionSize,
    required this.price,
    this.numberSold = 0,
  });

  int get remaining => editionSize - numberSold;
  bool get isSoldOut => remaining <= 0;
}

// Everything about one piece of art — this is the single source of truth
// that both the gallery grid and the detail screen read from.
class Artwork {
  final String id;
  final String title;
  final List<String> alternativeTitles;
  final String artistName;
  final String artistAlias; // e.g. "KarmenousHart"
  final String medium;
  final int year;
  final String dimensions; // display string, e.g. "24.5 × 17.55 inches / 62.2 × 44.6 cm"
  final String artistStatement;
  final List<String> technicalInfo; // bullet points
  final int originalPrice; // in Naira
  final bool originalAvailable; // false once the original artwork is sold
  final List<PrintEdition> prints;
  final String imageUrl; // path or network URL to the artwork image
  final bool signed;
  final bool framed;
  final bool includesCertificate;

  const Artwork({
    required this.id,
    required this.title,
    this.alternativeTitles = const [],
    required this.artistName,
    required this.artistAlias,
    required this.medium,
    required this.year,
    required this.dimensions,
    required this.artistStatement,
    required this.technicalInfo,
    required this.originalPrice,
    this.originalAvailable = true,
    this.prints = const [],
    required this.imageUrl,
    this.signed = true,
    this.framed = true,
    this.includesCertificate = true,
  });
}
