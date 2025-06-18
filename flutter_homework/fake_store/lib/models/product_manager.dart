// lib/core/managers/product_manager.dart

import 'package:fake_store/models/product_model.dart';
import 'package:fake_store/services/product_service.dart';

/// A single entry point for all product-related business logic:
/// - CRUD operations
/// - Local caching of newly added items
/// - Fetching categories
/// - Fetching a single product by ID

class ProductManager {
  ProductManager._internal();
  static final ProductManager instance = ProductManager._internal();

  final ProductService _service = ProductService();
  final List<Product> _localCache = [];

  /// Fetches all products, merging local cache first, then remote products
  Future<List<Product>> getAll() async {
    final remote = await _service.fetchAll();
    return [..._localCache, ...remote];
  }

  /// Fetches a single product by [id]
  Future<Product> fetchById(int id) async {
    // First check local cache
    try {
      return _localCache.firstWhere((p) => p.id == id);
    } catch (_) {
      // Not in cache, fetch from remote
      return await _service.fetchById(id);
    }
  }

  /// Creates a new product, caches it locally, and returns it
  Future<Product> create(Product product) async {
    final created = await _service.create(product);
    _localCache.insert(0, created);
    return created;
  }

  /// Updates an existing product on the server
  Future<Product> update(Product product) async {
    final updated = await _service.update(product);
    return updated;
  }

  /// Deletes a product: locally if cached, otherwise on the server
  Future<void> delete(int id) async {
    final isLocal = _localCache.any((p) => p.id == id);
    if (isLocal) {
      _localCache.removeWhere((p) => p.id == id);
    } else {
      await _service.delete(id);
    }
  }

  /// Fetches all categories
  Future<List<Category>> getCategories() async {
    return _service.fetchCategories();
  }
}
