// Turns 180000 into "₦180,000". Kept as a plain function (no package needed)
// so you can see exactly how comma-formatting works.
String formatNaira(int amount) {
  final digits = amount.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    final positionFromEnd = digits.length - i;
    buffer.write(digits[i]);
    final isThousandsBoundary = positionFromEnd > 1 && positionFromEnd % 3 == 1;
    if (isThousandsBoundary) buffer.write(',');
  }
  return '₦${buffer.toString()}';
}
