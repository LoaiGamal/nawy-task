import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/app_wrapper.dart';
import 'package:nawy_task/screens/more/more_screen.dart';
import 'package:nawy_task/screens/search/search_screen.dart';
import 'package:nawy_task/screens/results/results_screen.dart';
import 'package:nawy_task/screens/updates/updates_screen.dart';

class RouteManager {
  static const String search = '/search';
  static const String results = '/results';
  static const String updates = '/updates';
  static const String more = '/more';

  static GoRouter router = GoRouter(
    initialLocation: search,
    routes: <RouteBase>[
      GoRoute(
        path: search,
        builder: (BuildContext context, GoRouterState state) {
          return const AppWrapper(
            currentRoute: search,
            child: SearchScreen(),
          );
        },
      ),
      GoRoute(
        path: results,
        builder: (BuildContext context, GoRouterState state) {
          return const AppWrapper(
            currentRoute: results,
            child: ResultsScreen(),
          );
        },
      ),
      GoRoute(
        path: updates,
        builder: (BuildContext context, GoRouterState state) {
          return const AppWrapper(
            currentRoute: updates,
            child: UpdatesScreen(),
          );
        },
      ),
      GoRoute(
        path: more,
        builder: (BuildContext context, GoRouterState state) {
          return const AppWrapper(
            currentRoute: more,
            child: MoreScreen(),
          );
        },
      ),
    ],
  );
}