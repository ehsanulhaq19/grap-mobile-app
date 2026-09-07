class CreditBalance {
  const CreditBalance({
    required this.available,
    required this.used,
    required this.total,
  });

  final int available;
  final int used;
  final int total;

  double get usageRatio => total == 0 ? 0 : used / total;
}
