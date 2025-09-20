import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nawy_task/providers/navigation_provider.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NavigationProvider>().updateCurrentRoute(widget.currentRoute);
    });
  }

  @override
  void didUpdateWidget(AppWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentRoute != widget.currentRoute) {
      context.read<NavigationProvider>().updateCurrentRoute(widget.currentRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          body: widget.child,
          bottomNavigationBar: BottomNavigationBarWidget(
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) => navigationProvider.navigateToTab(index, context),
          ),
        );
      },
    );
  }
}
