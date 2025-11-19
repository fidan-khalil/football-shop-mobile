// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String category;
    String brand;
    String thumbnail;
    int price;
    String rating;
    String description;
    int userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.category,
        required this.brand,
        required this.thumbnail,
        required this.price,
        required this.rating,
        required this.description,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        brand: json["brand"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        rating: json["rating"],
        description: json["description"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "brand": brand,
        "thumbnail": thumbnail,
        "price": price,
        "rating": rating,
        "description": description,
        "user_id": userId,
    };
}