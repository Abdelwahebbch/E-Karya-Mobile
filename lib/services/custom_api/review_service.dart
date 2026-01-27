import '../../models/review_model.dart';

class ReviewService {
  static final ReviewService _instance = ReviewService._internal();

  factory ReviewService() => _instance;

  ReviewService._internal();

  // Mock review generator
  Review _mockReview({
    String id = 'review_1',
    String propertyId = 'property_1',
    String reviewerId = 'user_1',
    String revieweeId = 'user_2',
    double rating = 4.5,
    String title = 'Great stay!',
    String comment = 'Everything was clean and well organized.',
    List<String>? imageUrls,
    String reviewType = 'property',
  }) {
    return Review(
      id: id,
      propertyId: propertyId,
      reviewerId: reviewerId,
      revieweeId: revieweeId,
      rating: rating,
      title: title,
      comment: comment,
      imageUrls: imageUrls ?? const [],
      reviewType: reviewType,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      updatedAt: DateTime.now(),
    );
  }

  // Create review
  Future<Review> createReview({
    required String propertyId,
    required String revieweeId,
    required double rating,
    required String title,
    required String comment,
    required List<String> imageUrls,
    required String reviewType,
  }) async {
    return _mockReview(
      id: 'review_new',
      propertyId: propertyId,
      revieweeId: revieweeId,
      rating: rating,
      title: title,
      comment: comment,
      imageUrls: imageUrls,
      reviewType: reviewType,
    );
  }

  // Get review by ID
  Future<Review> getReviewById(String reviewId) async {
    return _mockReview(id: reviewId);
  }

  // Get property reviews
  Future<List<Review>> getPropertyReviews({
    required String propertyId,
    int page = 1,
    int limit = 10,
  }) async {
    return List.generate(
      4,
      (index) => _mockReview(
        id: 'property_review_$index',
        propertyId: propertyId,
        rating: 3.5 + index * 0.3,
      ),
    );
  }

  // Get landlord reviews
  Future<List<Review>> getLandlordReviews({
    required String landlordId,
    int page = 1,
    int limit = 10,
  }) async {
    return List.generate(
      3,
      (index) => _mockReview(
        id: 'landlord_review_$index',
        revieweeId: landlordId,
        reviewType: 'landlord',
      ),
    );
  }

  // Get user reviews (written by user)
  Future<List<Review>> getUserReviews({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    return List.generate(
      2,
      (index) => _mockReview(
        id: 'user_review_$index',
        reviewerId: userId,
      ),
    );
  }

  // Update review
  Future<Review> updateReview({
    required String reviewId,
    double? rating,
    String? title,
    String? comment,
    List<String>? imageUrls,
  }) async {
    return _mockReview(
      id: reviewId,
      rating: rating ?? 4.0,
      title: title ?? 'Updated review',
      comment: comment ?? 'Updated comment',
      imageUrls: imageUrls ?? const [],
    );
  }

  // Delete review
  Future<void> deleteReview(String reviewId) async {
    return;
  }

  // Get average rating for property
  Future<double> getPropertyAverageRating(String propertyId) async {
    final reviews = await getPropertyReviews(propertyId: propertyId);
    return reviews.map((r) => r.rating).reduce((a, b) => a + b) /
        reviews.length;
  }

  // Get average rating for landlord
  Future<double> getLandlordAverageRating(String landlordId) async {
    final reviews = await getLandlordReviews(landlordId: landlordId);
    return reviews.map((r) => r.rating).reduce((a, b) => a + b) /
        reviews.length;
  }
}
