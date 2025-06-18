// lib/core/services/api_service.dart

import 'package:dio/dio.dart';

/// A singleton service to handle all HTTP requests via Dio.
class ApiService {
  ApiService._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.escuelajs.co/api/v1',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ));
  }

  /// The single instance of [ApiService].
  static final ApiService instance = ApiService._internal();

  late final Dio _dio;

  /// Sends a GET request to the given [path].
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  /// Sends a POST request to the given [path] with an optional [body].
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    return await _dio.post(path, data: body);
  }

  /// Sends a PUT request to the given [path] with an optional [body].
  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    return await _dio.put(path, data: body);
  }

  /// Sends a DELETE request to the given [path].
  Future<Response> delete(
    String path,
  ) async {
    return await _dio.delete(path);
  }
}
