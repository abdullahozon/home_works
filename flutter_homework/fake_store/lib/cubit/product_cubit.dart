// lib/features/products/cubit/product_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:fake_store/models/product_manager.dart';
import '../models/product_model.dart';
import 'product_state.dart';

/// Cubit to manage product CRUD operations using ProductManager
class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  /// Fetches all products, merging local cache and remote
  Future<void> fetchAll() async {
    emit(ProductLoading());
    try {
      final products = await ProductManager.instance.getAll();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Fetches a single product by [id]
  Future<Product> fetchById(int id) async {
    return await ProductManager.instance.fetchById(id);
  }

  /// Creates a new product and refreshes the list
  Future<void> addProduct(Product product) async {
    emit(ProductLoading());
    try {
      await ProductManager.instance.create(product);
      final products = await ProductManager.instance.getAll();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Updates an existing product and refreshes the list
  Future<void> editProduct(Product product) async {
    emit(ProductLoading());
    try {
      await ProductManager.instance.update(product);
      final products = await ProductManager.instance.getAll();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Deletes a product and refreshes the list
  Future<void> removeProduct(int id) async {
    emit(ProductLoading());
    try {
      await ProductManager.instance.delete(id);
      final products = await ProductManager.instance.getAll();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
