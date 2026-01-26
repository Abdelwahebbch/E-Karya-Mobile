import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';
import '../../constants/app_constants.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  late SharedPreferences _prefs;

  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Login
  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
        fromJson: (json) => json,
      );

      final user = User.fromJson(response['user']);
      final token = response['token'] as String;

      await _saveUserData(user, token);
      _apiService.setAuthToken(token);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Sign up
  Future<User> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String userType,
  }) async {
    try {
      final response = await _apiService.post(
        '/auth/signup',
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'userType': userType,
        },
        fromJson: (json) => json,
      );

      final user = User.fromJson(response['user']);
      final token = response['token'] as String;

      await _saveUserData(user, token);
      _apiService.setAuthToken(token);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _apiService.post(
        '/auth/logout',
        data: {},
        fromJson: (json) => json,
      );
      await _clearUserData();
      _apiService.clearAuthToken();
    } catch (e) {
      // Clear local data even if API call fails
      await _clearUserData();
      _apiService.clearAuthToken();
      rethrow;
    }
  }

  // Refresh token
  Future<String> refreshToken() async {
    try {
      final response = await _apiService.post(
        '/auth/refresh-token',
        data: {},
        fromJson: (json) => json,
      );

      final token = response['token'] as String;
      await _prefs.setString(AppConstants.userTokenKey, token);
      _apiService.setAuthToken(token);

      return token;
    } catch (e) {
      rethrow;
    }
  }

  // Get current user
  Future<User?> getCurrentUser() async {
    try {
      final userJson = _prefs.getString(AppConstants.userDataKey);
      if (userJson != null) {
        return User.fromJson(Map<String, dynamic>.from(
          Map.from(userJson as Map),
        ));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = _prefs.getString(AppConstants.userTokenKey);
    return token != null && token.isNotEmpty;
  }

  // Get auth token
  String? getAuthToken() {
    return _prefs.getString(AppConstants.userTokenKey);
  }

  // Password reset
  Future<void> resetPassword({required String email}) async {
    try {
      await _apiService.post(
        '/auth/reset-password',
        data: {'email': email},
        fromJson: (json) => json,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Verify email
  Future<void> verifyEmail({required String code}) async {
    try {
      await _apiService.post(
        '/auth/verify-email',
        data: {'code': code},
        fromJson: (json) => json,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Save user data locally
  Future<void> _saveUserData(User user, String token) async {
    await _prefs.setString(AppConstants.userTokenKey, token);
    await _prefs.setString(AppConstants.userIdKey, user.id);
    await _prefs.setString(AppConstants.userTypeKey, user.userType);
    // Store user data as JSON string
    await _prefs.setString(
      AppConstants.userDataKey,
      user.toJson().toString(),
    );
  }

  // Clear user data
  Future<void> _clearUserData() async {
    await _prefs.remove(AppConstants.userTokenKey);
    await _prefs.remove(AppConstants.userIdKey);
    await _prefs.remove(AppConstants.userTypeKey);
    await _prefs.remove(AppConstants.userDataKey);
  }
}
