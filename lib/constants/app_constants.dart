class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.ekarya.com/v1';
  static const String apiTimeoutString = '30000'; // milliseconds

  // Firebase Configuration
  static const String firebaseProjectId = 'e-karya-project';
  static const String firebaseApiKey = 'YOUR_FIREBASE_API_KEY';

  // Stripe Configuration
  static const String stripePublishableKey = 'YOUR_STRIPE_PUBLISHABLE_KEY';

  // Google Maps Configuration
  static const String googleMapsApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';

  // App Configuration
  static const String appName = 'e-Karya';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int pageSize = 10;
  static const int initialPage = 1;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;

  // Duration
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration debounceDelay = Duration(milliseconds: 500);

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userIdKey = 'user_id';
  static const String userTypeKey = 'user_type';
  static const String userDataKey = 'user_data';
  static const String onboardingCompleteKey = 'onboarding_complete';

  // Property Types
  static const List<String> propertyTypes = [
    'Apartment',
    'House',
    'Studio',
    'Condo',
    'Townhouse',
    'Duplex',
    'Bungalow',
  ];

  // Amenities
  static const List<String> amenities = [
    'WiFi',
    'Air Conditioning',
    'Heating',
    'Kitchen',
    'Washer/Dryer',
    'Parking',
    'Swimming Pool',
    'Gym',
    'Security',
    'Garden',
  ];

  // Booking Status
  static const String bookingPending = 'pending';
  static const String bookingConfirmed = 'confirmed';
  static const String bookingCancelled = 'cancelled';
  static const String bookingCompleted = 'completed';

  // User Types
  static const String userTypeLandlord = 'landlord';
  static const String userTypeTenant = 'tenant';

  // Rental Types
  static const String rentalTypeLongTerm = 'long_term';
  static const String rentalTypeShortTerm = 'short_term';

  // Error Messages
  static const String errorGeneric = 'Something went wrong. Please try again.';
  static const String errorNetwork =
      'Network error. Please check your connection.';
  static const String errorInvalidEmail = 'Please enter a valid email address.';
  static const String errorPasswordMismatch = 'Passwords do not match.';
  static const String errorWeakPassword = 'Password is too weak.';
  static const String errorUserNotFound = 'User not found.';
  static const String errorUnauthorized = 'Unauthorized access.';

  // Success Messages
  static const String successLogin = 'Login successful!';
  static const String successSignup = 'Account created successfully!';
  static const String successPropertyAdded = 'Property added successfully!';
  static const String successBookingCreated = 'Booking created successfully!';
  static const String successReviewAdded = 'Review added successfully!';
}
