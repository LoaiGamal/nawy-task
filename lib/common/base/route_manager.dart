import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/app_wrapper.dart';
import 'package:nawy_task/screens/search/search_screen.dart';
import 'package:nawy_task/screens/results/results_screen.dart';

class RouteManager {
  static const String search = '/search';
  static const String results = '/results';

  static GoRouter router = GoRouter(
    initialLocation: search,
    routes: <RouteBase>[
      GoRoute(
        path: search,
        builder: (BuildContext context, GoRouterState state) {
          return AppWrapper(
            currentRoute: search,
            child: const SearchScreen(),
          );
        },
      ),
      GoRoute(
        path: results,
        builder: (BuildContext context, GoRouterState state) {
          return AppWrapper(
            currentRoute: results,
            child: const ResultsScreen(),
          );
        },
      ),
    ],
  );
}