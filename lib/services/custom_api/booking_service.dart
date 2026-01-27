import '../../models/booking_model.dart';

class BookingService {
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
      return Booking(
          id: "1",
          propertyId: "propertyId",
          tenantId: "tenantId",
          landlordId: "landlordId",
          checkInDate: DateTime(2025),
          checkOutDate: DateTime(2026),
          numberOfGuests: 4,
          totalPrice: 200,
          depositAmount: 2023,
          status: "status",
          paymentStatus: "paymentStatus",
          paymentMethod: "paymentMethod",
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026));
    } catch (e) {
      rethrow;
    }
  }

  // Get booking by ID
  Future<Booking> getBookingById(String bookingId) async {
    try {
      return Booking(
          id: "1",
          propertyId: "propertyId",
          tenantId: "tenantId",
          landlordId: "landlordId",
          checkInDate: DateTime(2025),
          checkOutDate: DateTime(2026),
          numberOfGuests: 4,
          totalPrice: 200,
          depositAmount: 2023,
          status: "status",
          paymentStatus: "paymentStatus",
          paymentMethod: "paymentMethod",
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026));
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
      
      List<Booking> bookings = [
        Booking(
            id: "1",
            propertyId: "propertyId",
            tenantId: "tenantId",
            landlordId: "landlordId",
            checkInDate: DateTime(2025),
            checkOutDate: DateTime(2026),
            numberOfGuests: 4,
            totalPrice: 200,
            depositAmount: 2023,
            status: "status",
            paymentStatus: "paymentStatus",
            paymentMethod: "paymentMethod",
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026)),
        Booking(
            id: "1",
            propertyId: "propertyId",
            tenantId: "tenantId",
            landlordId: "landlordId",
            checkInDate: DateTime(2025),
            checkOutDate: DateTime(2026),
            numberOfGuests: 4,
            totalPrice: 200,
            depositAmount: 2023,
            status: "status",
            paymentStatus: "paymentStatus",
            paymentMethod: "paymentMethod",
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026))
      ];
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
      List<Booking> bookings = [
        Booking(
            id: "1",
            propertyId: "propertyId",
            tenantId: "tenantId",
            landlordId: "landlordId",
            checkInDate: DateTime(2025),
            checkOutDate: DateTime(2026),
            numberOfGuests: 4,
            totalPrice: 200,
            depositAmount: 2023,
            status: "status",
            paymentStatus: "paymentStatus",
            paymentMethod: "paymentMethod",
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026)),
        Booking(
            id: "1",
            propertyId: "propertyId",
            tenantId: "tenantId",
            landlordId: "landlordId",
            checkInDate: DateTime(2025),
            checkOutDate: DateTime(2026),
            numberOfGuests: 4,
            totalPrice: 200,
            depositAmount: 2023,
            status: "status",
            paymentStatus: "paymentStatus",
            paymentMethod: "paymentMethod",
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026))
      ];

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
      return Booking(
          id: "1",
          propertyId: "propertyId",
          tenantId: "tenantId",
          landlordId: "landlordId",
          checkInDate: DateTime(2025),
          checkOutDate: DateTime(2026),
          numberOfGuests: 4,
          totalPrice: 200,
          depositAmount: 2023,
          status: "status",
          paymentStatus: "paymentStatus",
          paymentMethod: "paymentMethod",
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026));
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
      return Booking(
          id: "1",
          propertyId: "propertyId",
          tenantId: "tenantId",
          landlordId: "landlordId",
          checkInDate: DateTime(2025),
          checkOutDate: DateTime(2026),
          numberOfGuests: 4,
          totalPrice: 200,
          depositAmount: 2023,
          status: "status",
          paymentStatus: "paymentStatus",
          paymentMethod: "paymentMethod",
          createdAt: DateTime(2026),
          updatedAt: DateTime(2026));
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
      return true;
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
      return {"Test": "Paiment"};
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
      List<Booking> bookings = [
        Booking(
            id: "1",
            propertyId: "propertyId",
            tenantId: "tenantId",
            landlordId: "landlordId",
            checkInDate: DateTime(2025),
            checkOutDate: DateTime(2026),
            numberOfGuests: 4,
            totalPrice: 200,
            depositAmount: 2023,
            status: "status",
            paymentStatus: "paymentStatus",
            paymentMethod: "paymentMethod",
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026)),
        Booking(
            id: "1",
            propertyId: "propertyId",
            tenantId: "tenantId",
            landlordId: "landlordId",
            checkInDate: DateTime(2025),
            checkOutDate: DateTime(2026),
            numberOfGuests: 4,
            totalPrice: 200,
            depositAmount: 2023,
            status: "status",
            paymentStatus: "paymentStatus",
            paymentMethod: "paymentMethod",
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026))
      ];
      return bookings;
    } catch (e) {
      rethrow;
    }
  }
}
