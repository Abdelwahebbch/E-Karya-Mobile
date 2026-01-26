import 'package:flutter/material.dart';
import '../models/booking_model.dart';
import '../services/custom_api/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  final BookingService _bookingService = BookingService();

  List<Booking> _bookings = [];
  Booking? _selectedBooking;
  bool _isLoading = false;
  String? _error;

  List<Booking> get bookings => _bookings;
  Booking? get selectedBooking => _selectedBooking;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Create booking
  Future<bool> createBooking({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfGuests,
    required double totalPrice,
    required double depositAmount,
    required String paymentMethod,
    String? notes,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final newBooking = await _bookingService.createBooking(
        propertyId: propertyId,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        numberOfGuests: numberOfGuests,
        totalPrice: totalPrice,
        depositAmount: depositAmount,
        paymentMethod: paymentMethod,
        notes: notes,
      );

      _bookings.add(newBooking);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Get booking by ID
  Future<void> getBookingById(String bookingId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _selectedBooking = await _bookingService.getBookingById(bookingId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get tenant bookings
  Future<void> getTenantBookings({
    required String tenantId,
    int page = 1,
    String? status,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _bookings = await _bookingService.getTenantBookings(
        tenantId: tenantId,
        page: page,
        status: status,
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get landlord bookings
  Future<void> getLandlordBookings({
    required String landlordId,
    int page = 1,
    String? status,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _bookings = await _bookingService.getLandlordBookings(
        landlordId: landlordId,
        page: page,
        status: status,
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update booking status
  Future<bool> updateBookingStatus({
    required String bookingId,
    required String status,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final updatedBooking = await _bookingService.updateBookingStatus(
        bookingId: bookingId,
        status: status,
      );

      final index = _bookings.indexWhere((b) => b.id == bookingId);
      if (index != -1) {
        _bookings[index] = updatedBooking;
      }

      if (_selectedBooking?.id == bookingId) {
        _selectedBooking = updatedBooking;
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Cancel booking
  Future<bool> cancelBooking({
    required String bookingId,
    String? reason,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final cancelledBooking = await _bookingService.cancelBooking(
        bookingId: bookingId,
        reason: reason,
      );

      final index = _bookings.indexWhere((b) => b.id == bookingId);
      if (index != -1) {
        _bookings[index] = cancelledBooking;
      }

      if (_selectedBooking?.id == bookingId) {
        _selectedBooking = cancelledBooking;
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Check availability
  Future<bool> checkAvailability({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final isAvailable = await _bookingService.checkAvailability(
        propertyId: propertyId,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
      );

      _isLoading = false;
      notifyListeners();
      return isAvailable;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Process payment
  Future<bool> processPayment({
    required String bookingId,
    required String paymentMethodId,
    required double amount,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _bookingService.processPayment(
        bookingId: bookingId,
        paymentMethodId: paymentMethodId,
        amount: amount,
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearSelectedBooking() {
    _selectedBooking = null;
    notifyListeners();
  }
}
