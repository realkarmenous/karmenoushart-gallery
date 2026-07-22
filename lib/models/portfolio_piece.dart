// A past portrait piece shown on the "Work With Me" portfolio page.
// This is separate from Artwork (which is for pieces you're selling) —
// these are examples of your past commission/portrait work, grouped by size.
class PortfolioPiece {
  final String id;
  final String title;
  final String imageUrl;
  final String size; // 'A2' or 'A3' — used to group pieces into sections
  final int year;

  const PortfolioPiece({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.size,
    required this.year,
  });
}
