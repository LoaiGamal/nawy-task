import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/home_screen.dart';

class RouteManager {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String help = '/help';

  static GoRouter router = GoRouter(
    initialLocation: home,
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage(title: 'title');
        },
        routes: <RouteBase>[
          GoRoute(
            path: profile,
            builder: (BuildContext context, GoRouterState state) {
              return const SizedBox();
            },
          ),
        ],
      ),
    ],
  );
}