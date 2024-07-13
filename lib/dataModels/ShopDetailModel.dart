class ShopDetail {
  final String shopName;
  final String distance;
  final String amount;
  final bool isFeatured;
  final List<String> services;
  final double rating;

  ShopDetail({
    required this.shopName,
    required this.distance,
    required this.amount,
    required this.services,
    required this.isFeatured,
    required this.rating,
  });
}
