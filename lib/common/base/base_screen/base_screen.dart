import 'package:flutter/material.dart';
import 'package:nawy_task/common/base/theme.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool showAppBar;
  final String? appBarTitle;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final EdgeInsetsGeometry? padding;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const BaseScreen({
    super.key,
    required this.child,
    this.showAppBar = false,
    this.appBarTitle,
    this.appBarActions,
    this.appBarLeading,
    this.bottom,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.padding,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor ?? Colors.white,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: showAppBar
          ? AppBar(
        title: appBarTitle != null
            ? Text(
          appBarTitle!,
          style: MyAppTheme.instance.appBarTitleStyle(),
        )
            : null,
        actions: appBarActions,
        leading: appBarLeading,
        bottom: bottom,
        backgroundColor: backgroundColor ?? Colors.white,
        elevation: 0,
        centerTitle: true,
      )
          : null,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        left: safeAreaLeft,
        right: safeAreaRight,
        child: Padding(
          padding: padding ?? MyAppTheme.instance.primaryPadding,
          child: child,
        ),
      ),
    );
  }
}

// Convenience constructors for common use cases
class BaseScreenWithAppBar extends BaseScreen {
  const BaseScreenWithAppBar({
    super.key,
    required super.child,
    required String title,
    List<Widget>? actions,
    Widget? leading,
    super.bottom,
    super.backgroundColor,
    super.padding,
    super.safeAreaTop,
    super.safeAreaBottom,
    super.safeAreaLeft,
    super.safeAreaRight,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.bottomNavigationBar,
    super.drawer,
    super.endDrawer,
    super.scaffoldKey,
  }) : super(
    showAppBar: true,
    appBarTitle: title,
    appBarActions: actions,
    appBarLeading: leading,
  );
}

class BaseScreenWithBottomNav extends BaseScreen {
  const BaseScreenWithBottomNav({
    super.key,
    required super.child,
    required Widget super.bottomNavigationBar,
    super.showAppBar,
    super.appBarTitle,
    super.appBarActions,
    super.appBarLeading,
    super.bottom,
    super.backgroundColor,
    super.padding,
    super.safeAreaTop,
    super.safeAreaBottom,
    super.safeAreaLeft,
    super.safeAreaRight,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.drawer,
    super.endDrawer,
    super.scaffoldKey,
  });
}

class BaseScreenWithDrawer extends BaseScreen {
  const BaseScreenWithDrawer({
    super.key,
    required super.child,
    required Widget super.drawer,
    super.showAppBar,
    super.appBarTitle,
    super.appBarActions,
    super.appBarLeading,
    super.bottom,
    super.backgroundColor,
    super.padding,
    super.safeAreaTop,
    super.safeAreaBottom,
    super.safeAreaLeft,
    super.safeAreaRight,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.bottomNavigationBar,
    super.endDrawer,
    super.scaffoldKey,
  });
}