class Product{
  final int id;
  final String productImage;
  final String productName;
  final String productDescription;
  final double price;
  bool favourite;

  Product({
    required this.id,
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.favourite
  });
}