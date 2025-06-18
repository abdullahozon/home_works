// lib/features/products/services/product_service.dart


import 'package:fake_store/services/api_service.dart';

import '../models/product_model.dart';

/// Service to perform CRUD operations on Products via ApiService.
class ProductService {
  final ApiService _api = ApiService.instance;

  /// Fetches all products without pagination.
  Future<List<Product>> fetchAll() async {
    final response = await _api.get('/products');
    final data = response.data as List;
    return data
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Fetches a single product by its [id].
  Future<Product> fetchById(int id) async {
    final response = await _api.get('/products/$id');
    return Product.fromJson(response.data as Map<String, dynamic>);
  }

  /// Creates a new product with the given [product] data.
  Future<Product> create(Product product) async {
    final response = await _api.post('/products', body: product.toJson());
    return Product.fromJson(response.data as Map<String, dynamic>);
  }

  /// Updates an existing [product].
  Future<Product> update(Product product) async {
    final response = await _api.put(
      '/products/${product.id}',
      body: product.toJson(),
    );
    return Product.fromJson(response.data as Map<String, dynamic>);
  }

  /// Deletes a product by its [id]. Returns true if deletion was successful.
  Future<bool> delete(int id) async {
    final response = await _api.delete('/products/$id');
    return response.data == true;
  }

  /// Fetches all categories for dropdown selection.
  Future<List<Category>> fetchCategories() async {
    final response = await _api.get('/categories');
    final data = response.data as List;
    return data
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
