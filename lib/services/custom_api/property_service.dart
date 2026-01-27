import 'package:e_karya/constants/app_constants.dart';
import '../../models/property_model.dart';

class PropertyService {
  static final PropertyService _instance = PropertyService._internal();

  factory PropertyService() => _instance;

  PropertyService._internal();

  // Mock property generator
  Property _mockProperty({
    String id = 'property_1',
    String landlordId = 'landlord_1',
    String title = 'Modern Apartment',
    String description = 'A beautiful and comfortable property.',
    String propertyType = 'apartment',
    String address = '123 Main Street',
    String city = 'Tunis',
    String state = 'TN',
    String zipCode = '1000',
    double latitude = 36.8065,
    double longitude = 10.1815,
    double price = 120.0,
    String rentalType = AppConstants.rentalTypeLongTerm,
    int bedrooms = 2,
    int bathrooms = 1,
    double squareFeet = 80,
    List<String>? amenities,
    List<String>? imageUrls,
    double rating = 4.6,
    int reviewCount = 42,
    bool isAvailable = true,
  }) {
    return Property(
      id: id,
      landlordId: landlordId,
      title: title,
      description: description,
      propertyType: propertyType,
      address: address,
      city: city,
      state: state,
      zipCode: zipCode,
      latitude: latitude,
      longitude: longitude,
      price: price,
      rentalType: rentalType,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      squareFeet: squareFeet,
      amenities: amenities ?? const ['WiFi', 'Parking', 'AC'],
      imageUrls: imageUrls ??
          const [
            'https://picsum.photos/400/300',
            'https://picsum.photos/401/300',
          ],
      rating: rating,
      reviewCount: reviewCount,
      isAvailable: isAvailable,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
    );
  }

  // Get all properties (with filters)
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
    return List.generate(
      limit,
      (index) => _mockProperty(
        id: 'property_$index',
        city: city ?? 'Tunis',
        price: 80 + (index * 20),
        propertyType: propertyType ?? 'apartment',
        rentalType: rentalType ?? AppConstants.rentalTypeLongTerm,
        bedrooms: bedrooms ?? 2,
        bathrooms: bathrooms ?? 1,
      ),
    );
  }

  // Get property by ID
  Future<Property> getPropertyById(String propertyId) async {
    return _mockProperty(id: propertyId);
  }

  // Get landlord properties
  Future<List<Property>> getLandlordProperties({
    required String landlordId,
    int page = 1,
    int limit = 10,
  }) async {
    return List.generate(
      limit,
      (index) => _mockProperty(
        id: 'landlord_property_$index',
        landlordId: landlordId,
      ),
    );
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
    return _mockProperty(
      id: 'property_new',
      title: title,
      description: description,
      propertyType: propertyType,
      address: address,
      city: city,
      state: state,
      zipCode: zipCode,
      latitude: latitude,
      longitude: longitude,
      price: price,
      rentalType: rentalType,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      squareFeet: squareFeet,
      amenities: amenities,
      imageUrls: imageUrls,
    );
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
    return _mockProperty(
      id: propertyId,
      title: title ?? 'Updated Property',
      description: description ?? 'Updated description',
      propertyType: propertyType ?? 'apartment',
      address: address ?? 'Updated address',
      city: city ?? 'Tunis',
      state: state ?? 'TN',
      zipCode: zipCode ?? '1000',
      latitude: latitude ?? 36.8,
      longitude: longitude ?? 10.1,
      price: price ?? 150,
      rentalType: rentalType ?? AppConstants.rentalTypeLongTerm,
      bedrooms: bedrooms ?? 3,
      bathrooms: bathrooms ?? 2,
      squareFeet: squareFeet ?? 120,
      amenities: amenities,
      imageUrls: imageUrls,
      isAvailable: isAvailable ?? true,
    );
  }

  // Delete property
  Future<void> deleteProperty(String propertyId) async {
    return;
  }

  // Search by location
  Future<List<Property>> searchByLocation({
    required double latitude,
    required double longitude,
    required double radiusInKm,
  }) async {
    return List.generate(
      5,
      (index) => _mockProperty(
        id: 'nearby_$index',
        latitude: latitude + (index * 0.01),
        longitude: longitude + (index * 0.01),
      ),
    );
  }

  // Get featured properties
  Future<List<Property>> getFeaturedProperties() async {
    return [
      _mockProperty(
        id: 'featured_1',
        title: 'Featured Villa',
        propertyType: 'villa',
        price: 300,
        rating: 4.9,
      ),
      _mockProperty(
        id: 'featured_2',
        title: 'Luxury Studio',
        propertyType: 'studio',
        price: 180,
        rating: 4.8,
      ),
    ];
  }
}
