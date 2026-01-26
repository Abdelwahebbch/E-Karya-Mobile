import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final String id;
  final String landlordId;
  final String title;
  final String description;
  final String propertyType; // Apartment, House, Studio, etc.
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final double latitude;
  final double longitude;
  final double price;
  final String rentalType; // long_term or short_term
  final int bedrooms;
  final int bathrooms;
  final double squareFeet;
  final List<String> amenities;
  final List<String> imageUrls;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? landlordName;
  final String? landlordImage;

  const Property({
    required this.id,
    required this.landlordId,
    required this.title,
    required this.description,
    required this.propertyType,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.rentalType,
    required this.bedrooms,
    required this.bathrooms,
    required this.squareFeet,
    required this.amenities,
    required this.imageUrls,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
    this.landlordName,
    this.landlordImage,
  });

  String get fullAddress => '$address, $city, $state $zipCode';

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as String,
      landlordId: json['landlordId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      propertyType: json['propertyType'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      rentalType: json['rentalType'] as String,
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      squareFeet: (json['squareFeet'] as num).toDouble(),
      amenities: List<String>.from(json['amenities'] as List),
      imageUrls: List<String>.from(json['imageUrls'] as List),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      landlordName: json['landlordName'] as String?,
      landlordImage: json['landlordImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'landlordId': landlordId,
      'title': title,
      'description': description,
      'propertyType': propertyType,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'latitude': latitude,
      'longitude': longitude,
      'price': price,
      'rentalType': rentalType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'squareFeet': squareFeet,
      'amenities': amenities,
      'imageUrls': imageUrls,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'landlordName': landlordName,
      'landlordImage': landlordImage,
    };
  }

  Property copyWith({
    String? id,
    String? landlordId,
    String? title,
    String? description,
    String? propertyType,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    double? latitude,
    double? longitude,
    double? price,
    String? rentalType,
    int? bedrooms,
    int? bathrooms,
    double? squareFeet,
    List<String>? amenities,
    List<String>? imageUrls,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? landlordName,
    String? landlordImage,
  }) {
    return Property(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      title: title ?? this.title,
      description: description ?? this.description,
      propertyType: propertyType ?? this.propertyType,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      price: price ?? this.price,
      rentalType: rentalType ?? this.rentalType,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      squareFeet: squareFeet ?? this.squareFeet,
      amenities: amenities ?? this.amenities,
      imageUrls: imageUrls ?? this.imageUrls,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      landlordName: landlordName ?? this.landlordName,
      landlordImage: landlordImage ?? this.landlordImage,
    );
  }

  @override
  List<Object?> get props => [
        id,
        landlordId,
        title,
        description,
        propertyType,
        address,
        city,
        state,
        zipCode,
        latitude,
        longitude,
        price,
        rentalType,
        bedrooms,
        bathrooms,
        squareFeet,
        amenities,
        imageUrls,
        rating,
        reviewCount,
        isAvailable,
        createdAt,
        updatedAt,
        landlordName,
        landlordImage,
      ];
}
