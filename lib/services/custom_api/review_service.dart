import '../../models/review_model.dart';
import 'api_service.dart';

class ReviewService {
  final ApiService _apiService = ApiService();

  static final ReviewService _instance = ReviewService._internal();

  factory ReviewService() {
    return _instance;
  }

  ReviewService._internal();

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
    try {
      final response = await _apiService.post(
        '/reviews',
        data: {
          'propertyId': propertyId,
          'revieweeId': revieweeId,
          'rating': rating,
          'title': title,
          'comment': comment,
          'imageUrls': imageUrls,
          'reviewType': reviewType,
        },
        fromJson: (json) => json,
      );

      return Review.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Get review by ID
  Future<Review> getReviewById(String reviewId) async {
    try {
      final response = await _apiService.get(
        '/reviews/$reviewId',
        fromJson: (json) => json,
      );

      return Review.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Get property reviews
  Future<List<Review>> getPropertyReviews({
    required String propertyId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _apiService.get(
        '/reviews/property/$propertyId',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        fromJson: (json) => json,
      );

      final reviews = (response['reviews'] as List)
          .map((r) => Review.fromJson(r as Map<String, dynamic>))
          .toList();

      return reviews;
    } catch (e) {
      rethrow;
    }
  }

  // Get landlord reviews
  Future<List<Review>> getLandlordReviews({
    required String landlordId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _apiService.get(
        '/reviews/landlord/$landlordId',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        fromJson: (json) => json,
      );

      final reviews = (response['reviews'] as List)
          .map((r) => Review.fromJson(r as Map<String, dynamic>))
          .toList();

      return reviews;
    } catch (e) {
      rethrow;
    }
  }

  // Get user reviews (reviews written by user)
  Future<List<Review>> getUserReviews({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _apiService.get(
        '/reviews/user/$userId',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        fromJson: (json) => json,
      );

      final reviews = (response['reviews'] as List)
          .map((r) => Review.fromJson(r as Map<String, dynamic>))
          .toList();

      return reviews;
    } catch (e) {
      rethrow;
    }
  }

  // Update review
  Future<Review> updateReview({
    required String reviewId,
    double? rating,
    String? title,
    String? comment,
    List<String>? imageUrls,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (rating != null) data['rating'] = rating;
      if (title != null) data['title'] = title;
      if (comment != null) data['comment'] = comment;
      if (imageUrls != null) data['imageUrls'] = imageUrls;

      final response = await _apiService.put(
        '/reviews/$reviewId',
        data: data,
        fromJson: (json) => json,
      );

      return Review.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // Delete review
  Future<void> deleteReview(String reviewId) async {
    try {
      await _apiService.delete(
        '/reviews/$reviewId',
        fromJson: (json) => json,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Get average rating for property
  Future<double> getPropertyAverageRating(String propertyId) async {
    try {
      final response = await _apiService.get(
        '/reviews/property/$propertyId/rating',
        fromJson: (json) => json,
      );

      return (response['averageRating'] as num).toDouble();
    } catch (e) {
      rethrow;
    }
  }

  // Get average rating for landlord
  Future<double> getLandlordAverageRating(String landlordId) async {
    try {
      final response = await _apiService.get(
        '/reviews/landlord/$landlordId/rating',
        fromJson: (json) => json,
      );

      return (response['averageRating'] as num).toDouble();
    } catch (e) {
      rethrow;
    }
  }
}
