import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/common/main_layout.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/shop/presentation/product_list_screen.dart';
import '../../features/shop/presentation/cart_screen.dart';
import '../../features/auth/presentation/profile_screen.dart';

import '../../features/home/presentation/search_screen.dart';
import '../../features/shop/presentation/wishlist_screen.dart';
import '../../features/shop/presentation/category_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/splash/presentation/location_permission_screen.dart';
import '../../features/blog/presentation/blog_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/location-permission',
      builder: (context, state) => const LocationPermissionScreen(),
    ),
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
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/wishlist',
          builder: (context, state) => const WishlistScreen(),
        ),
        GoRoute(
          path: '/category',
          builder: (context, state) => const CategoryScreen(),
        ),
        GoRoute(
          path: '/blog',
          builder: (context, state) => const BlogScreen(),
        ),

      ],
    ),
  ],
);
