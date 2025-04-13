class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String imageURL;
  Map<String, dynamic> rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.imageURL,
      required this.rating});
}
