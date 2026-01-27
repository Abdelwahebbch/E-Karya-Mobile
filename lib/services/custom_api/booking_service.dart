import '../../models/booking_model.dart';

class BookingService {
  static final BookingService _instance = BookingService._internal();

  factory BookingService() => _instance;

  BookingService._internal();

  // Mock generator
  Booking _mockBooking({
    String id = '1',
    String propertyId = 'property_1',
    String tenantId = 'tenant_1',
    String landlordId = 'landlord_1',
    String status = 'confirmed',
    String paymentStatus = 'paid',
    String paymentMethod = 'card',
    DateTime? checkInDate,
    DateTime? checkOutDate,
  }) {
    return Booking(
      id: id,
      propertyId: propertyId,
      tenantId: tenantId,
      landlordId: landlordId,
      checkInDate: checkInDate ?? DateTime(2025, 6, 10),
      checkOutDate: checkOutDate ?? DateTime(2025, 6, 15),
      numberOfGuests: 2,
      totalPrice: 500.0,
      depositAmount: 150.0,
      status: status,
      paymentStatus: paymentStatus,
      paymentMethod: paymentMethod,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now(),
    );
  }

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
    return _mockBooking(
      id: 'booking_101',
      propertyId: propertyId,
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      paymentMethod: paymentMethod,
      status: 'pending',
      paymentStatus: 'unpaid',
    );
  }

  // Get booking by ID
  Future<Booking> getBookingById(String bookingId) async {
    return _mockBooking(id: bookingId);
  }

  // Get tenant bookings
  Future<List<Booking>> getTenantBookings({
    required String tenantId,
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    return List.generate(
      3,
      (index) => _mockBooking(
        id: 'tenant_booking_$index',
        tenantId: tenantId,
        status: status ?? 'confirmed',
      ),
    );
  }

  // Get landlord bookings
  Future<List<Booking>> getLandlordBookings({
    required String landlordId,
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    return List.generate(
      3,
      (index) => _mockBooking(
        id: 'landlord_booking_$index',
        landlordId: landlordId,
        status: status ?? 'confirmed',
      ),
    );
  }

  // Update booking status
  Future<Booking> updateBookingStatus({
    required String bookingId,
    required String status,
  }) async {
    return _mockBooking(
      id: bookingId,
      status: status,
    );
  }

  // Cancel booking
  Future<Booking> cancelBooking({
    required String bookingId,
    String? reason,
  }) async {
    return _mockBooking(
      id: bookingId,
      status: 'cancelled',
      paymentStatus: 'refunded',
    );
  }

  // Check property availability
  Future<bool> checkAvailability({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
  }) async {
    return true; // always available (mock)
  }

  // Process payment
  Future<Map<String, dynamic>> processPayment({
    required String bookingId,
    required String paymentMethodId,
    required double amount,
  }) async {
    return {
      'bookingId': bookingId,
      'status': 'success',
      'amount': amount,
      'paymentMethodId': paymentMethodId,
    };
  }

  // Get booking history
  Future<List<Booking>> getBookingHistory({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    return List.generate(
      5,
      (index) => _mockBooking(
        id: 'history_$index',
        tenantId: userId,
        status: 'completed',
      ),
    );
  }
}
