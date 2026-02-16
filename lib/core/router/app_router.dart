import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/common/main_layout.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/shop/presentation/product_list_screen.dart';
import '../../features/shop/presentation/cart_screen.dart';
import '../../features/auth/presentation/profile_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductListScreen(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartScreen(),
        ),
        GoRoute(
          path: '/account', // Matches web route '/account'
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
