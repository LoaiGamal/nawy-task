import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/common/base/route_manager.dart';
import 'package:nawy_task/widgets/navigation/bottom_navigation_bar_widget.dart';

class AppWrapper extends StatefulWidget {
  final Widget child;
  final String currentRoute;

  const AppWrapper({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _updateCurrentIndex();
  }

  @override
  void didUpdateWidget(AppWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentRoute != widget.currentRoute) {
      _updateCurrentIndex();
    }
  }

  void _updateCurrentIndex() {
    switch (widget.currentRoute) {
      case RouteManager.search:
        _currentIndex = 0;
        break;
      case RouteManager.results:
        _currentIndex = 0; // Keep Explore selected when on results
        break;
      case RouteManager.updates:
        _currentIndex = 1; // Set Updates tab as selected
        break;
      case RouteManager.more:
        _currentIndex = 3; // Set Updates tab as selected
        break;
      default:
        _currentIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  void _onBottomNavTap(int index) {
    switch (index) {
      case 0:
        context.go(RouteManager.search);
        break;
      case 1:
        context.go(RouteManager.updates);
        break;
      case 2:
        // Navigate to Favorites
        break;
      case 3:
        context.go(RouteManager.more);
        break;
    }
  }
}
