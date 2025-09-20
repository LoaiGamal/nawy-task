import 'package:flutter/material.dart';

enum SortOption {
  priceAsc,
  priceDesc,
  areaAsc,
  areaDesc,
  newest,
  oldest,
}

enum FilterType {
  city,
  compound,
  apartment,
  villa,
  townhouse,
}

class ResultsProvider extends ChangeNotifier {
  int _selectedTabIndex = 0;
  int _selectedFilterIndex = 0;
  SortOption _selectedSortOption = SortOption.newest;
  List<FilterType> _activeFilters = [FilterType.city];
  bool _isLoading = false;
  int _resultsCount = 450;
  Map<int, bool> _favorites = {};

  // Getters
  int get selectedTabIndex => _selectedTabIndex;
  int get selectedFilterIndex => _selectedFilterIndex;
  SortOption get selectedSortOption => _selectedSortOption;
  List<FilterType> get activeFilters => _activeFilters;
  bool get isLoading => _isLoading;
  int get resultsCount => _resultsCount;
  Map<int, bool> get favorites => _favorites;

  // Tab management
  void updateSelectedTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  // Filter management
  void updateSelectedFilter(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }

  void addFilter(FilterType filter) {
    if (!_activeFilters.contains(filter)) {
      _activeFilters.add(filter);
      notifyListeners();
    }
  }

  void removeFilter(FilterType filter) {
    _activeFilters.remove(filter);
    notifyListeners();
  }

  void clearAllFilters() {
    _activeFilters = [FilterType.city];
    notifyListeners();
  }

  // Sort management
  void updateSortOption(SortOption option) {
    _selectedSortOption = option;
    notifyListeners();
  }

  // Loading state
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Results count
  void updateResultsCount(int count) {
    _resultsCount = count;
    notifyListeners();
  }

  // Favorites management
  void toggleFavorite(int propertyId) {
    _favorites[propertyId] = !(_favorites[propertyId] ?? false);
    notifyListeners();
  }

  bool isFavorite(int propertyId) {
    return _favorites[propertyId] ?? false;
  }

  // Get sort option display text
  String getSortOptionText(SortOption option) {
    switch (option) {
      case SortOption.priceAsc:
        return 'Price: Low to High';
      case SortOption.priceDesc:
        return 'Price: High to Low';
      case SortOption.areaAsc:
        return 'Area: Small to Large';
      case SortOption.areaDesc:
        return 'Area: Large to Small';
      case SortOption.newest:
        return 'Newest First';
      case SortOption.oldest:
        return 'Oldest First';
    }
  }

  // Get filter type display text
  String getFilterTypeText(FilterType type) {
    switch (type) {
      case FilterType.city:
        return 'City, Governorate';
      case FilterType.compound:
        return 'Compound name';
      case FilterType.apartment:
        return 'Apartment';
      case FilterType.villa:
        return 'Villa';
      case FilterType.townhouse:
        return 'Townhouse';
    }
  }

  // Get all available sort options
  List<SortOption> get allSortOptions => SortOption.values;

  // Get all available filter types
  List<FilterType> get allFilterTypes => FilterType.values;

  // Check if any filters are active (excluding default city filter)
  bool get hasActiveFilters {
    return _activeFilters.length > 1 || _selectedSortOption != SortOption.newest;
  }

  // Reset to default state
  void reset() {
    _selectedTabIndex = 0;
    _selectedFilterIndex = 0;
    _selectedSortOption = SortOption.newest;
    _activeFilters = [FilterType.city];
    _isLoading = false;
    _resultsCount = 450;
    notifyListeners();
  }
}
