// lib/features/products/cubit/product_state.dart

import '../models/product_model.dart';

/// States for ProductCubit
abstract class ProductState {}

/// Initial state before any actions.
class ProductInitial extends ProductState {}

/// State when loading data.
class ProductLoading extends ProductState {}

/// State when products have been loaded successfully.
class ProductsLoaded extends ProductState {
  final List<Product> products;
  ProductsLoaded(this.products);
}

/// State when an error has occurred.
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
