import '../../models/booking_model.dart';
import 'api_service.dart';

class BookingService {
  final ApiService _apiService = ApiService();

  static final BookingService _instance = BookingService._internal();

  factory BookingService() {
    return _instance;
  }

  BookingService._internal();

  // Create booking
  Future<Booking> createBooking({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfGuests,
    required double totalPrice,
    required double depositAmount,
    required String paymentMethod,
    String? notes,
  }) async {
    try {
      final response = await _apiService.post(
        '/bookings',
        data: {
          'propertyId': propertyId,
          'checkInDate': checkInDate.toIso8601String(),
          'checkOutDate': checkOutDate.toIso8601String(),
          'numberOfGuests': numberOfGuests,
          'totalPrice': totalPrice,
          'depositAmount': depositAmount,
          'paymentMethod': paymentMethod,
          'notes': notes,
        },
        fromJson: (json) => json,
      );

      return Booking.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Get booking by ID
  Future<Booking> getBookingById(String bookingId) async {
    try {
      final response = await _apiService.get(
        '/bookings/$bookingId',
        fromJson: (json) => json,
      );

      return Booking.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Get tenant bookings
  Future<List<Booking>> getTenantBookings({
    required String tenantId,
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'limit': limit,
        if (status != null) 'status': status,
      };

      final response = await _apiService.get(
        '/bookings/tenant/$tenantId',
        queryParameters: queryParams,
        fromJson: (json) => json,
      );

      final bookings = (response['bookings'] as List)
          .map((b) => Booking.fromJson(b as Map<String, dynamic>))
          .toList();

      return bookings;
    } catch (e) {
      rethrow;
    }
  }

  // Get landlord bookings
  Future<List<Booking>> getLandlordBookings({
    required String landlordId,
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    try {
      final queryParams = {
        'page': page,
        'limit': limit,
        if (status != null) 'status': status,
      };

      final response = await _apiService.get(
        '/bookings/landlord/$landlordId',
        queryParameters: queryParams,
        fromJson: (json) => json,
      );

      final bookings = (response['bookings'] as List)
          .map((b) => Booking.fromJson(b as Map<String, dynamic>))
          .toList();

      return bookings;
    } catch (e) {
      rethrow;
    }
  }

  // Update booking status
  Future<Booking> updateBookingStatus({
    required String bookingId,
    required String status,
  }) async {
    try {
      final response = await _apiService.patch(
        '/bookings/$bookingId/status',
        data: {'status': status},
        fromJson: (json) => json,
      );

      return Booking.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Cancel booking
  Future<Booking> cancelBooking({
    required String bookingId,
    String? reason,
  }) async {
    try {
      final response = await _apiService.patch(
        '/bookings/$bookingId/cancel',
        data: {'reason': reason},
        fromJson: (json) => json,
      );

      return Booking.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Check property availability
  Future<bool> checkAvailability({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
  }) async {
    try {
      final response = await _apiService.get(
        '/bookings/check-availability',
        queryParameters: {
          'propertyId': propertyId,
          'checkInDate': checkInDate.toIso8601String(),
          'checkOutDate': checkOutDate.toIso8601String(),
        },
        fromJson: (json) => json,
      );

      return response['isAvailable'] as bool;
    } catch (e) {
      rethrow;
    }
  }

  // Process payment
  Future<Map<String, dynamic>> processPayment({
    required String bookingId,
    required String paymentMethodId,
    required double amount,
  }) async {
    try {
      final response = await _apiService.post(
        '/bookings/$bookingId/payment',
        data: {
          'paymentMethodId': paymentMethodId,
          'amount': amount,
        },
        fromJson: (json) => json,
      );

      return response as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  // Get booking history
  Future<List<Booking>> getBookingHistory({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _apiService.get(
        '/bookings/history/$userId',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        fromJson: (json) => json,
      );

      final bookings = (response['bookings'] as List)
          .map((b) => Booking.fromJson(b as Map<String, dynamic>))
          .toList();

      return bookings;
    } catch (e) {
      rethrow;
    }
  }
}
