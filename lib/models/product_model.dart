class Product {
  /// Define final for required variables
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
  // Map<String, dynamic> rating;

  /// Constructor
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  /// toJson to store/update/delete data (Post)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'imageURL': image,
      'rating': rating.toJson(),
      // 'rating': {
      //   'rate': rating['rate'],
      //   'count': rating['count'],
      // },
    };
  }

  /// fromJson for fetched data view (GET)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']), // using Rating model
      // rating: {
      //   'rate': json['rating']['rate'],
      //   'count': json['rating']['count'],
      // },
    );
  }
}

/// Rating Class related to Product Class rating field so i declare class here
class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
