import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/common/base/my_app_images.dart';
import 'package:nawy_task/common/base/route_manager.dart';
import 'package:nawy_task/common/base/theme.dart';

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
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: MyAppTheme.instance.lightGrayColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: MyAppTheme.instance.orangeColor,
        unselectedItemColor: MyAppTheme.instance.grayColor,
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        currentIndex: _currentIndex,
        onTap: (index) => _onBottomNavTap(index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icSearch,
              colorFilter: ColorFilter.mode(
                _currentIndex == 0 
                  ? MyAppTheme.instance.orangeColor 
                  : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icUpdates,
              colorFilter: ColorFilter.mode(
                _currentIndex == 1 
                  ? MyAppTheme.instance.orangeColor 
                  : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icFavorite,
              colorFilter: ColorFilter.mode(
                _currentIndex == 2 
                  ? MyAppTheme.instance.orangeColor 
                  : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icMore,
              colorFilter: ColorFilter.mode(
                _currentIndex == 3 
                  ? MyAppTheme.instance.orangeColor 
                  : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'More',
          ),
        ],
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
