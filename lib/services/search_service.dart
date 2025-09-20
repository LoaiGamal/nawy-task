import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nawy_task/providers/property_provider.dart';
import 'package:nawy_task/providers/results_provider.dart';
import 'package:nawy_task/providers/search_provider.dart';

class SearchService {
  // Perform search with current filters
  static void performSearch(BuildContext context) {
    final searchProvider = context.read<SearchProvider>();
    final propertyProvider = context.read<PropertyProvider>();
    final resultsProvider = context.read<ResultsProvider>();

    // Get search filters
    final filters = searchProvider.getSearchFilters();

    // Apply search query
    if (filters['query'].toString().isNotEmpty) {
      propertyProvider.searchProperties(filters['query'].toString());
    }

    // Apply property type filter
    propertyProvider.filterByType(filters['propertyType'].toString());

    // Apply room count filter
    propertyProvider.filterByRooms(
      filters['minRooms'] as int,
      filters['maxRooms'] as int,
    );

    // Apply price filter
    propertyProvider.filterByPriceRange(filters['price'].toString());

    // Update results count
    resultsProvider.updateResultsCount(propertyProvider.filteredProperties.length);
  }

  // Clear all search filters
  static void clearSearch(BuildContext context) {
    final searchProvider = context.read<SearchProvider>();
    final propertyProvider = context.read<PropertyProvider>();
    final resultsProvider = context.read<ResultsProvider>();

    // Clear search provider
    searchProvider.clearSearch();

    // Clear property filters
    propertyProvider.clearAllFilters();

    // Reset results
    resultsProvider.updateResultsCount(propertyProvider.filteredProperties.length);
  }

  // Apply sort to current results
  static void applySort(BuildContext context, String sortOption) {
    final propertyProvider = context.read<PropertyProvider>();
    propertyProvider.sortProperties(sortOption);
  }

  // Toggle favorite property
  static void toggleFavorite(BuildContext context, int propertyId) {
    final propertyProvider = context.read<PropertyProvider>();
    propertyProvider.toggleFavorite(propertyId);
  }

  // Get favorite properties
  static List<dynamic> getFavoriteProperties(BuildContext context) {
    final propertyProvider = context.read<PropertyProvider>();
    return propertyProvider.favoriteProperties;
  }
}
