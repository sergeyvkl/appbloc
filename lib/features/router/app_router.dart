// lib/features/router/app_router.dart
import 'package:go_router/go_router.dart';
import '../../main_screen.dart';
import '../../screens/details_screen.dart';

class AppRouter {
  // Синглтон паттерн
  AppRouter._();
  static final AppRouter instance = AppRouter._();

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Главный экран с BottomNavigationBar
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MainScreen(),
        routes: [
          // Детальный экран
          GoRoute(
            path: 'details',
            name: 'details',
            builder: (context, state) => const DetailsScreen(),
          ),
        ],
      ),
    ],
  );
}