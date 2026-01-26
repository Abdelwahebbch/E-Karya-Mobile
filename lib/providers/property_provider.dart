import 'package:flutter/material.dart';
import '../models/property_model.dart';
import '../services/custom_api/property_service.dart';

class PropertyProvider extends ChangeNotifier {
  final PropertyService _propertyService = PropertyService();

  List<Property> _properties = [];
  List<Property> _featuredProperties = [];
  Property? _selectedProperty;
  bool _isLoading = false;
  String? _error;
  int _currentPage = 1;
  bool _hasMorePages = true;

  List<Property> get properties => _properties;
  List<Property> get featuredProperties => _featuredProperties;
  Property? get selectedProperty => _selectedProperty;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get currentPage => _currentPage;
  bool get hasMorePages => _hasMorePages;

  // Get all properties with filters
  Future<void> getProperties({
    int page = 1,
    String? city,
    double? minPrice,
    double? maxPrice,
    String? propertyType,
    String? rentalType,
    int? bedrooms,
    int? bathrooms,
    bool loadMore = false,
  }) async {
    if (!loadMore) {
      _isLoading = true;
      _currentPage = 1;
      _properties = [];
    }
    _error = null;
    notifyListeners();

    try {
      final newProperties = await _propertyService.getProperties(
        page: page,
        city: city,
        minPrice: minPrice,
        maxPrice: maxPrice,
        propertyType: propertyType,
        rentalType: rentalType,
        bedrooms: bedrooms,
        bathrooms: bathrooms,
      );

      if (loadMore) {
        _properties.addAll(newProperties);
        _currentPage++;
      } else {
        _properties = newProperties;
      }

      _hasMorePages = newProperties.isNotEmpty;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get property by ID
  Future<void> getPropertyById(String propertyId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _selectedProperty = await _propertyService.getPropertyById(propertyId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get landlord properties
  Future<void> getLandlordProperties({
    required String landlordId,
    int page = 1,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _properties = await _propertyService.getLandlordProperties(
        landlordId: landlordId,
        page: page,
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Create property
  Future<bool> createProperty({
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
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final newProperty = await _propertyService.createProperty(
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

      _properties.add(newProperty);
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

  // Update property
  Future<bool> updateProperty({
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
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final updatedProperty = await _propertyService.updateProperty(
        propertyId: propertyId,
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
        isAvailable: isAvailable,
      );

      final index = _properties.indexWhere((p) => p.id == propertyId);
      if (index != -1) {
        _properties[index] = updatedProperty;
      }

      if (_selectedProperty?.id == propertyId) {
        _selectedProperty = updatedProperty;
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

  // Delete property
  Future<bool> deleteProperty(String propertyId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _propertyService.deleteProperty(propertyId);
      _properties.removeWhere((p) => p.id == propertyId);
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

  // Get featured properties
  Future<void> getFeaturedProperties() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _featuredProperties = await _propertyService.getFeaturedProperties();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Search by location
  Future<void> searchByLocation({
    required double latitude,
    required double longitude,
    required double radiusInKm,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _properties = await _propertyService.searchByLocation(
        latitude: latitude,
        longitude: longitude,
        radiusInKm: radiusInKm,
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearSelectedProperty() {
    _selectedProperty = null;
    notifyListeners();
  }
}
