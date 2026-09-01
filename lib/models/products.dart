class Product{
  final int id;
  final String name;
  final String description;
  final double price;
  final String? size;
  final String imageUrl;
  final bool isLimitedEdition;
  final String color;
  final String? collection;
  final String? category;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.size,
    required this.imageUrl,
    this.isLimitedEdition = false,
    required this.color,
    this.collection,
    this.category,
  });

}