import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../constants/app_constants.dart';

class ApiService {
  late Dio _dio;
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? AppConstants.baseUrl;
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: AppConstants.apiTimeout,
        receiveTimeout: AppConstants.apiTimeout,
        contentType: 'application/json',
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token if available
          final token = _getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Handle errors
          if (error.response?.statusCode == 401) {
            // Handle unauthorized
          }
          return handler.next(error);
        },
      ),
    );
  }

  String? _getAuthToken() {
    // This should be implemented to retrieve the auth token from secure storage
    return null;
  }

  // GET request
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // POST request
  Future<T> post<T>(
    String endpoint, {
    required Map<String, dynamic> data,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // PUT request
  Future<T> put<T>(
    String endpoint, {
    required Map<String, dynamic> data,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
      );
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // DELETE request
  Future<T> delete<T>(
    String endpoint, {
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await _dio.delete(endpoint);
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // PATCH request
  Future<T> patch<T>(
    String endpoint, {
    required Map<String, dynamic> data,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
      );
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // Upload file
  Future<T> uploadFile<T>(
    String endpoint, {
    required String filePath,
    required String fieldName,
    Map<String, dynamic>? additionalFields,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(filePath),
        if (additionalFields != null) ...additionalFields,
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
      );
      return fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
