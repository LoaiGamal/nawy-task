import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/common/base/route_manager.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  String _currentRoute = RouteManager.search;

  // Getters
  int get currentIndex => _currentIndex;
  String get currentRoute => _currentRoute;

  // Update current route and corresponding tab index
  void updateCurrentRoute(String route) {
    _currentRoute = route;
    _updateCurrentIndex();
    notifyListeners();
  }

  // Update current tab index
  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Navigate to specific tab
  void navigateToTab(int index, BuildContext context) {
    _currentIndex = index;
    
    switch (index) {
      case 0:
        context.go(RouteManager.search);
        break;
      case 1:
        context.go(RouteManager.updates);
        break;
      case 2:
        // Navigate to Favorites (if route exists)
        // context.go(RouteManager.favorites);
        break;
      case 3:
        context.go(RouteManager.more);
        break;
    }
    
    notifyListeners();
  }

  // Update current index based on route
  void _updateCurrentIndex() {
    switch (_currentRoute) {
      case RouteManager.search:
        _currentIndex = 0;
        break;
      case RouteManager.results:
        _currentIndex = 0; // Keep Explore selected when on results
        break;
      case RouteManager.updates:
        _currentIndex = 1;
        break;
      case RouteManager.more:
        _currentIndex = 3;
        break;
      default:
        _currentIndex = 0;
    }
  }

  // Check if current route matches a specific route
  bool isCurrentRoute(String route) {
    return _currentRoute == route;
  }

  // Get tab label based on index
  String getTabLabel(int index) {
    switch (index) {
      case 0:
        return 'Explore';
      case 1:
        return 'Updates';
      case 2:
        return 'Favorites';
      case 3:
        return 'More';
      default:
        return '';
    }
  }

  // Reset to default state
  void reset() {
    _currentIndex = 0;
    _currentRoute = RouteManager.search;
    notifyListeners();
  }
}
