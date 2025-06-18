// lib/features/products/models/product_model.dart

/// Represents a product category.
class Category {
  final int id;
  final String name;
  final String image;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      slug: json['slug'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'slug': slug,
    };
  }
}

/// Represents a product.
class Product {
  final int? id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final Category category;
  final List<String> images;

  Product({
    this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      images: List<String>.from(json['images'] as List<dynamic>),
    );
  }

  /// Converts to JSON for create/update.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'categoryId': category.id,
      'images': images,
    };
  }
}
