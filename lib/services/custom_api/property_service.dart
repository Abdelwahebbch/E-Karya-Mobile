import 'package:e_karya/constants/app_constants.dart';

import '../../models/property_model.dart';

class PropertyService {
  // final ApiService _apiService = ApiService();

  static final PropertyService _instance = PropertyService._internal();

  factory PropertyService() {
    return _instance;
  }

  PropertyService._internal();

  // Get all properties with filters
  Future<List<Property>> getProperties({
    int page = 1,
    int limit = 10,
    String? city,
    double? minPrice,
    double? maxPrice,
    String? propertyType,
    String? rentalType,
    int? bedrooms,
    int? bathrooms,
  }) async {
    try {
      // final queryParams = {
      //   'page': page,
      //   'limit': limit,
      //   if (city != null) 'city': city,
      //   if (minPrice != null) 'minPrice': minPrice,
      //   if (maxPrice != null) 'maxPrice': maxPrice,
      //   if (propertyType != null) 'propertyType': propertyType,
      //   if (rentalType != null) 'rentalType': rentalType,
      //   if (bedrooms != null) 'bedrooms': bedrooms,
      //   if (bathrooms != null) 'bathrooms': bathrooms,
      // };

      // final response = await _apiService.get(
      //   '/properties',
      //   queryParameters: queryParams,
      //   fromJson: (json) => json,
      // );

      // final properties = (response['properties'] as List)
      //     .map((p) => Property.fromJson(p as Map<String, dynamic>))
      //     .toList();
      List<Property> properties = [
        Property(
            id: "0",
            landlordId: "0",
            title: "title",
            description: "getProperties method",
            propertyType: "propertyType",
            address: "address",
            city: "city",
            state: "state",
            zipCode: "zipCode",
            latitude: 0.1,
            longitude: 0.2,
            price: 10.5,
            rentalType: AppConstants.rentalTypeLongTerm,
            bedrooms: 4,
            bathrooms: 4,
            squareFeet: 4,
            amenities: const ["1", "2", "3"],
            imageUrls: const ["1", "2", "3"],
            rating: 9,
            reviewCount: 100,
            isAvailable: true,
            createdAt: DateTime(2020),
            updatedAt: DateTime(2020))
      ];
      return properties;
    } catch (e) {
      rethrow;
    }
  }

  // Get property by ID
  Future<Property> getPropertyById(String propertyId) async {
    try {
      // final response = await _apiService.get(
      //   '/properties/$propertyId',
      //   fromJson: (json) => json,
      // );

      // return Property.fromJson(response);

      return Property(
          id: "0",
          landlordId: "0",
          title: "title",
          description: "description",
          propertyType: "propertyType",
          address: "address",
          city: "city",
          state: "state",
          zipCode: "zipCode",
          latitude: 0.1,
          longitude: 0.2,
          price: 10.5,
          rentalType: AppConstants.rentalTypeLongTerm,
          bedrooms: 4,
          bathrooms: 4,
          squareFeet: 4,
          amenities: const ["1", "2", "3"],
          imageUrls: const ["1", "2", "3"],
          rating: 9,
          reviewCount: 100,
          isAvailable: true,
          createdAt: DateTime(2020),
          updatedAt: DateTime(2020));
    } catch (e) {
      rethrow;
    }
  }

  // Get landlord properties
  Future<List<Property>> getLandlordProperties({
    required String landlordId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      // final response = await _apiService.get(
      //   '/properties/landlord/$landlordId',
      //   queryParameters: {
      //     'page': page,
      //     'limit': limit,
      //   },
      //   fromJson: (json) => json,
      // );

      // final properties = (response['properties'] as List)
      //     .map((p) => Property.fromJson(p as Map<String, dynamic>))
      //     .toList();
      List<Property> properties = [
        Property(
            id: "0",
            landlordId: "0",
            title: "title",
            description: "description",
            propertyType: "propertyType",
            address: "address",
            city: "city",
            state: "state",
            zipCode: "zipCode",
            latitude: 0.1,
            longitude: 0.2,
            price: 10.5,
            rentalType: AppConstants.rentalTypeLongTerm,
            bedrooms: 4,
            bathrooms: 4,
            squareFeet: 4,
            amenities: const ["1", "2", "3"],
            imageUrls: const ["1", "2", "3"],
            rating: 9,
            reviewCount: 100,
            isAvailable: true,
            createdAt: DateTime(2020),
            updatedAt: DateTime(2020))
      ];
      return properties;
    } catch (e) {
      rethrow;
    }
  }

  // Create property
  Future<Property> createProperty({
    required String title,
    required String description,
    required String propertyType,
    required String address,
    required String city,
    required String state,
    required String zipCode,
    required double latitude,
    required double longitude,
    required double price,
    required String rentalType,
    required int bedrooms,
    required int bathrooms,
    required double squareFeet,
    required List<String> amenities,
    required List<String> imageUrls,
  }) async {
    try {
      // final response = await _apiService.post(
      //   '/properties',
      //   data: {
      //     'title': title,
      //     'description': description,
      //     'propertyType': propertyType,
      //     'address': address,
      //     'city': city,
      //     'state': state,
      //     'zipCode': zipCode,
      //     'latitude': latitude,
      //     'longitude': longitude,
      //     'price': price,
      //     'rentalType': rentalType,
      //     'bedrooms': bedrooms,
      //     'bathrooms': bathrooms,
      //     'squareFeet': squareFeet,
      //     'amenities': amenities,
      //     'imageUrls': imageUrls,
      //   },
      //   fromJson: (json) => json,
      // );
      //return Property.fromJson(response);
      return Property(
          id: "0",
          landlordId: "0",
          title: "title",
          description: "Create property method",
          propertyType: "propertyType",
          address: "address",
          city: "city",
          state: "state",
          zipCode: "zipCode",
          latitude: 0.1,
          longitude: 0.2,
          price: 10.5,
          rentalType: AppConstants.rentalTypeLongTerm,
          bedrooms: 4,
          bathrooms: 4,
          squareFeet: 4,
          amenities: const ["1", "2", "3"],
          imageUrls: const ["1", "2", "3"],
          rating: 9,
          reviewCount: 100,
          isAvailable: true,
          createdAt: DateTime(2020),
          updatedAt: DateTime(2020));
    } catch (e) {
      rethrow;
    }
  }

  // Update property
  Future<Property> updateProperty({
    required String propertyId,
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
    bool? isAvailable,
  }) async {
    try {
      // final data = <String, dynamic>{};
      // if (title != null) data['title'] = title;
      // if (description != null) data['description'] = description;
      // if (propertyType != null) data['propertyType'] = propertyType;
      // if (address != null) data['address'] = address;
      // if (city != null) data['city'] = city;
      // if (state != null) data['state'] = state;
      // if (zipCode != null) data['zipCode'] = zipCode;
      // if (latitude != null) data['latitude'] = latitude;
      // if (longitude != null) data['longitude'] = longitude;
      // if (price != null) data['price'] = price;
      // if (rentalType != null) data['rentalType'] = rentalType;
      // if (bedrooms != null) data['bedrooms'] = bedrooms;
      // if (bathrooms != null) data['bathrooms'] = bathrooms;
      // if (squareFeet != null) data['squareFeet'] = squareFeet;
      // if (amenities != null) data['amenities'] = amenities;
      // if (imageUrls != null) data['imageUrls'] = imageUrls;
      // if (isAvailable != null) data['isAvailable'] = isAvailable;

      // final response = await _apiService.put(
      //   '/properties/$propertyId',
      //   data: data,
      //   fromJson: (json) => json,
      // );

      // return Property.fromJson(response);
      return Property(
          id: "0",
          landlordId: "0",
          title: "title",
          description: "Update method",
          propertyType: "propertyType",
          address: "address",
          city: "city",
          state: "state",
          zipCode: "zipCode",
          latitude: 0.1,
          longitude: 0.2,
          price: 10.5,
          rentalType: AppConstants.rentalTypeLongTerm,
          bedrooms: 4,
          bathrooms: 4,
          squareFeet: 4,
          amenities: const ["1", "2", "3"],
          imageUrls: const ["1", "2", "3"],
          rating: 9,
          reviewCount: 100,
          isAvailable: true,
          createdAt: DateTime(2020),
          updatedAt: DateTime(2020));
    } catch (e) {
      rethrow;
    }
  }

  // Delete property
  Future<void> deleteProperty(String propertyId) async {
    try {
      // await _apiService.delete(
      //   '/properties/$propertyId',
      //   fromJson: (json) => json,
      // );
    } catch (e) {
      rethrow;
    }
  }

  // Search properties by location
  Future<List<Property>> searchByLocation({
    required double latitude,
    required double longitude,
    required double radiusInKm,
  }) async {
    try {
      // final response = await _apiService.get(
      //   '/properties/search/location',
      //   queryParameters: {
      //     'latitude': latitude,
      //     'longitude': longitude,
      //     'radius': radiusInKm,
      //   },
      //   fromJson: (json) => json,
      // );

      // final properties = (response['properties'] as List)
      //     .map((p) => Property.fromJson(p as Map<String, dynamic>))
      //     .toList();
      List<Property> properties = [
        Property(
            id: "0",
            landlordId: "0",
            title: "title",
            description: "Search by location method",
            propertyType: "propertyType",
            address: "address",
            city: "city",
            state: "state",
            zipCode: "zipCode",
            latitude: 0.1,
            longitude: 0.2,
            price: 10.5,
            rentalType: AppConstants.rentalTypeLongTerm,
            bedrooms: 4,
            bathrooms: 4,
            squareFeet: 4,
            amenities: const ["1", "2", "3"],
            imageUrls: const ["1", "2", "3"],
            rating: 9,
            reviewCount: 100,
            isAvailable: true,
            createdAt: DateTime(2020),
            updatedAt: DateTime(2020))
      ];
      return properties;
    } catch (e) {
      rethrow;
    }
  }

  // Get featured properties
  Future<List<Property>> getFeaturedProperties() async {
    try {
      // final response = await _apiService.get(
      //   '/properties/featured',
      //   fromJson: (json) => json,
      // );

      // final properties = (response['properties'] as List)
      //     .map((p) => Property.fromJson(p as Map<String, dynamic>))
      //     .toList();
      List<Property> properties = [
        Property(
            id: "0",
            landlordId: "0",
            title: "title",
            description: "description",
            propertyType: "propertyType",
            address: "address",
            city: "city",
            state: "state",
            zipCode: "zipCode",
            latitude: 0.1,
            longitude: 0.2,
            price: 10.5,
            rentalType: AppConstants.rentalTypeLongTerm,
            bedrooms: 4,
            bathrooms: 4,
            squareFeet: 4,
            amenities: const ["1", "2", "3"],
            imageUrls: const ["https://abdelwaheb.dev/images/portfolioImg.jpeg", "2", "3"],
            rating: 9,
            reviewCount: 100,
            isAvailable: true,
            createdAt: DateTime(2020),
            updatedAt: DateTime(2020)),
        Property(
            id: "1",
            landlordId: "5",
            title: "title",
            description: "description",
            propertyType: "propertyType",
            address: "address",
            city: "city",
            state: "state",
            zipCode: "zipCode",
            latitude: 0.1,
            longitude: 0.2,
            price: 10.5,
            rentalType: AppConstants.rentalTypeLongTerm,
            bedrooms: 4,
            bathrooms: 4,
            squareFeet: 4,
            amenities: const ["1", "2", "3"],
            imageUrls: const ["1", "2", "3"],
            rating: 9,
            reviewCount: 100,
            isAvailable: true,
            createdAt: DateTime(2020),
            updatedAt: DateTime(2020))
      ];
      return properties;
    } catch (e) {
      rethrow;
    }
  }
}
