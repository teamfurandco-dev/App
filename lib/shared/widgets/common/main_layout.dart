import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  
  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/category')) return 1;
    if (location.startsWith('/blog')) return 2;
    if (location.startsWith('/cart')) return 3;
    if (location.startsWith('/account')) return 4;
    if (location == '/') return 0;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/category');
        break;
      case 2:
        context.go('/blog');
        break;
      case 3:
        context.go('/cart');
        break;
      case 4:
        context.go('/account');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 32,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.search, color: AppColors.black),
            onPressed: () => context.go('/search'),
          ),
          IconButton(
            icon: const Icon(LucideIcons.heart, color: AppColors.black),
            onPressed: () => context.go('/wishlist'),
          ),
          IconButton(
            icon: const Icon(LucideIcons.shoppingCart, color: AppColors.black),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (index) => _onItemTapped(index, context),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary, // Black in some modes, Primary in others? Design says active text is white on black usually?
          // Webapp MobileBottomNav says: active ? "text-white" : "text-gray-400" but background is black capsule.
          // For standard BottomNavBar, mimicking that exact look is hard without custom widget. 
          // Going with standard styling first: Primary = Active, Gray = Inactive.
          unselectedItemColor: AppColors.gray,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.shoppingBag),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.bookOpen),
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.shoppingCart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
