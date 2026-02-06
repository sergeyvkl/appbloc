import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/details_screen.dart';
import '../../screens/home_acreen.dart';

/// The route configuration.
final GoRouter routerMain = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);