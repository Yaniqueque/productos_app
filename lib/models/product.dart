import 'dart:convert';

Map<String, Product> productFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

String productToJson(Map<String, Product> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
    this.id
  });

  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    available: json["available"],
    name: json["name"],
    picture: json["picture"],
    price: json["price"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "available": available,
    "name": name,
    "picture": picture,
    "price": price,
  };

  Product copy() {
    return Product(
        available: this.available,
        name:      this.name,
        picture:   this.picture,
        price:     this.price,
        id:        this.id
    );
  }

}
