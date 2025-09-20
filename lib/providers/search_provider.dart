import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  RangeValues _roomRange = const RangeValues(1, 4);
  String _selectedPrice = 'Any';
  String _selectedArea = 'Any';
  String _selectedPropertyType = 'Any';

  // Getters
  TextEditingController get searchController => _searchController;
  RangeValues get roomRange => _roomRange;
  String get selectedPrice => _selectedPrice;
  String get selectedArea => _selectedArea;
  String get selectedPropertyType => _selectedPropertyType;

  // Search query getter
  String get searchQuery => _searchController.text.trim();

  // Room range formatter
  String get roomRangeText => '${_roomRange.start.round()} ~ ${_roomRange.end.round()}+ rooms';

  // Update room range
  void updateRoomRange(RangeValues values) {
    _roomRange = values;
    notifyListeners();
  }

  // Update selected price
  void updateSelectedPrice(String price) {
    _selectedPrice = price;
    notifyListeners();
  }

  // Update selected area
  void updateSelectedArea(String area) {
    _selectedArea = area;
    notifyListeners();
  }

  // Update selected property type
  void updateSelectedPropertyType(String propertyType) {
    _selectedPropertyType = propertyType;
    notifyListeners();
  }

  // Clear search
  void clearSearch() {
    _searchController.clear();
    _roomRange = const RangeValues(1, 4);
    _selectedPrice = 'Any';
    _selectedArea = 'Any';
    _selectedPropertyType = 'Any';
    notifyListeners();
  }

  // Get search filters as map
  Map<String, dynamic> getSearchFilters() {
    return {
      'query': searchQuery,
      'price': _selectedPrice,
      'area': _selectedArea,
      'propertyType': _selectedPropertyType,
      'minRooms': _roomRange.start.round(),
      'maxRooms': _roomRange.end.round(),
    };
  }

  // Check if search has any filters applied
  bool get hasActiveFilters {
    return searchQuery.isNotEmpty ||
        _selectedPrice != 'Any' ||
        _selectedArea != 'Any' ||
        _selectedPropertyType != 'Any' ||
        _roomRange != const RangeValues(1, 4);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
