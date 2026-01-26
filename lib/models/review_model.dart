import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String propertyId;
  final String reviewerId;
  final String revieweeId;
  final double rating;
  final String title;
  final String comment;
  final List<String> imageUrls;
  final String reviewType; // property or landlord
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? reviewerName;
  final String? reviewerImage;

  const Review({
    required this.id,
    required this.propertyId,
    required this.reviewerId,
    required this.revieweeId,
    required this.rating,
    required this.title,
    required this.comment,
    required this.imageUrls,
    required this.reviewType,
    required this.createdAt,
    required this.updatedAt,
    this.reviewerName,
    this.reviewerImage,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      propertyId: json['propertyId'] as String,
      reviewerId: json['reviewerId'] as String,
      revieweeId: json['revieweeId'] as String,
      rating: (json['rating'] as num).toDouble(),
      title: json['title'] as String,
      comment: json['comment'] as String,
      imageUrls: List<String>.from(json['imageUrls'] as List? ?? []),
      reviewType: json['reviewType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      reviewerName: json['reviewerName'] as String?,
      reviewerImage: json['reviewerImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'propertyId': propertyId,
      'reviewerId': reviewerId,
      'revieweeId': revieweeId,
      'rating': rating,
      'title': title,
      'comment': comment,
      'imageUrls': imageUrls,
      'reviewType': reviewType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'reviewerName': reviewerName,
      'reviewerImage': reviewerImage,
    };
  }

  Review copyWith({
    String? id,
    String? propertyId,
    String? reviewerId,
    String? revieweeId,
    double? rating,
    String? title,
    String? comment,
    List<String>? imageUrls,
    String? reviewType,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? reviewerName,
    String? reviewerImage,
  }) {
    return Review(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      reviewerId: reviewerId ?? this.reviewerId,
      revieweeId: revieweeId ?? this.revieweeId,
      rating: rating ?? this.rating,
      title: title ?? this.title,
      comment: comment ?? this.comment,
      imageUrls: imageUrls ?? this.imageUrls,
      reviewType: reviewType ?? this.reviewType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerImage: reviewerImage ?? this.reviewerImage,
    );
  }

  @override
  List<Object?> get props => [
        id,
        propertyId,
        reviewerId,
        revieweeId,
        rating,
        title,
        comment,
        imageUrls,
        reviewType,
        createdAt,
        updatedAt,
        reviewerName,
        reviewerImage,
      ];
}
