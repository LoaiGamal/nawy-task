import 'package:flutter/material.dart';

class PropertyModel {
  final int id;
  final String title;
  final String deliveryDate;
  final String price;
  final String monthlyPayment;
  final String location;
  final String address;
  final String bedrooms;
  final String bathrooms;
  final String area;
  final String imageUrl;
  final String propertyType;
  final String developer;
  final double rating;
  final List<String> amenities;

  PropertyModel({
    required this.id,
    required this.title,
    required this.deliveryDate,
    required this.price,
    required this.monthlyPayment,
    required this.location,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.imageUrl,
    required this.propertyType,
    required this.developer,
    required this.rating,
    required this.amenities,
  });

  // Factory constructor for creating mock data
  factory PropertyModel.mock(int id) {
    return PropertyModel(
      id: id,
      title: 'Serviced apartment',
      deliveryDate: 'Delivery 2028',
      price: 'EGP 999,999,999',
      monthlyPayment: '117,493 EGP/month over 7 years',
      location: 'Mountain View - Chillout park',
      address: '6th October, Egypt',
      bedrooms: '9',
      bathrooms: '9',
      area: '240-320 m²',
      imageUrl: '',
      propertyType: 'Apartment',
      developer: 'Mountain View Developer',
      rating: 4.5,
      amenities: ['Swimming Pool', 'Gym', 'Parking', 'Security'],
    );
  }
}

class PropertyProvider extends ChangeNotifier {
  List<PropertyModel> _properties = [];
  List<PropertyModel> _filteredProperties = [];
  bool _isLoading = false;
  String? _error;
  Map<int, bool> _favorites = {};

  // Getters
  List<PropertyModel> get properties => _properties;
  List<PropertyModel> get filteredProperties => _filteredProperties;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<int, bool> get favorites => _favorites;

  // Get favorite properties
  List<PropertyModel> get favoriteProperties {
    return _properties.where((property) => _favorites[property.id] == true).toList();
  }

  // Initialize with mock data
  void initializeMockData() {
    _isLoading = true;
    notifyListeners();

    // Simulate API call delay
    Future.delayed(const Duration(seconds: 1), () {
      _properties = List.generate(10, (index) => PropertyModel.mock(index + 1));
      _filteredProperties = List.from(_properties);
      _isLoading = false;
      notifyListeners();
    });
  }

  // Search properties
  void searchProperties(String query) {
    if (query.isEmpty) {
      _filteredProperties = List.from(_properties);
    } else {
      _filteredProperties = _properties.where((property) {
        return property.title.toLowerCase().contains(query.toLowerCase()) ||
               property.location.toLowerCase().contains(query.toLowerCase()) ||
               property.address.toLowerCase().contains(query.toLowerCase()) ||
               property.developer.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  // Filter properties by type
  void filterByType(String propertyType) {
    if (propertyType == 'Any') {
      _filteredProperties = List.from(_properties);
    } else {
      _filteredProperties = _properties.where((property) {
        return property.propertyType.toLowerCase() == propertyType.toLowerCase();
      }).toList();
    }
    notifyListeners();
  }

  // Filter properties by price range
  void filterByPriceRange(String priceRange) {
    if (priceRange == 'Any') {
      _filteredProperties = List.from(_properties);
    } else {
      // This would need actual price parsing logic in a real app
      _filteredProperties = List.from(_properties);
    }
    notifyListeners();
  }

  // Filter properties by room count
  void filterByRooms(int minRooms, int maxRooms) {
    _filteredProperties = _properties.where((property) {
      final roomCount = int.tryParse(property.bedrooms) ?? 0;
      return roomCount >= minRooms && roomCount <= maxRooms;
    }).toList();
    notifyListeners();
  }

  // Sort properties
  void sortProperties(String sortOption) {
    switch (sortOption) {
      case 'Price: Low to High':
        _filteredProperties.sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
        break;
      case 'Price: High to Low':
        _filteredProperties.sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
        break;
      case 'Area: Small to Large':
        _filteredProperties.sort((a, b) => _parseArea(a.area).compareTo(_parseArea(b.area)));
        break;
      case 'Area: Large to Small':
        _filteredProperties.sort((a, b) => _parseArea(b.area).compareTo(_parseArea(a.area)));
        break;
      case 'Newest First':
        _filteredProperties.sort((a, b) => b.deliveryDate.compareTo(a.deliveryDate));
        break;
      case 'Oldest First':
        _filteredProperties.sort((a, b) => a.deliveryDate.compareTo(b.deliveryDate));
        break;
    }
    notifyListeners();
  }

  // Toggle favorite
  void toggleFavorite(int propertyId) {
    _favorites[propertyId] = !(_favorites[propertyId] ?? false);
    notifyListeners();
  }

  // Check if property is favorite
  bool isFavorite(int propertyId) {
    return _favorites[propertyId] ?? false;
  }

  // Get property by ID
  PropertyModel? getPropertyById(int id) {
    try {
      return _properties.firstWhere((property) => property.id == id);
    } catch (e) {
      return null;
    }
  }

  // Clear all filters
  void clearAllFilters() {
    _filteredProperties = List.from(_properties);
    notifyListeners();
  }

  // Set error
  void setError(String error) {
    _error = error;
    _isLoading = false;
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Helper method to parse price (simplified)
  double _parsePrice(String price) {
    // Remove "EGP" and commas, then parse
    final cleanPrice = price.replaceAll(RegExp(r'[^\d]'), '');
    return double.tryParse(cleanPrice) ?? 0.0;
  }

  // Helper method to parse area (simplified)
  double _parseArea(String area) {
    // Extract first number from area string like "240-320 m²"
    final match = RegExp(r'\d+').firstMatch(area);
    return double.tryParse(match?.group(0) ?? '0') ?? 0.0;
  }

  // Reset to initial state
  void reset() {
    _properties = [];
    _filteredProperties = [];
    _isLoading = false;
    _error = null;
    _favorites = {};
    notifyListeners();
  }
}
