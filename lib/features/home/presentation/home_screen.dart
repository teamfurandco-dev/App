import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController _slideController = PageController();
  int _currentSlide = 0;
  Timer? _slideTimer;

  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/images/pet_frame1.png',
      'label': 'Playtime 🎾',
      'caption': 'Happy pets, happy home.',
    },
    {
      'image': 'assets/images/pet_frame2.png',
      'label': 'Mealtime 🍽️',
      'caption': 'Nutrition they love, quality you trust.',
    },
    {
      'image': 'assets/images/pet_frame3.png',
      'label': 'Rest Time 💤',
      'caption': 'Peace and comfort, every single day.',
    },
  ];

  // Featured products for home page
  final List<Map<String, dynamic>> _featuredProducts = [
    {
      'name': 'Adjustable Dog Harness',
      'brand': 'Fur & Co',
      'price': '₹799',
      'oldPrice': null,
      'imageUrl': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      'tag': '🐶 Dogs',
    },
    {
      'name': 'Feather Wand Cat Toy',
      'brand': 'Fur & Co',
      'price': '₹299',
      'oldPrice': null,
      'imageUrl': 'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?w=400&h=400&fit=crop',
      'tag': '🐱 Cats',
    },
    {
      'name': 'Daily Nutrition Dry Food',
      'brand': 'Fur & Co',
      'price': '₹1,299',
      'oldPrice': '₹1,599',
      'imageUrl': 'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=400&h=400&fit=crop',
      'tag': '🐶 Dogs',
    },
    {
      'name': 'Premium Wet Cat Food',
      'brand': 'Fur & Co',
      'price': '₹899',
      'oldPrice': null,
      'imageUrl': 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=400&h=400&fit=crop',
      'tag': '🐱 Cats',
    },
  ];

  final List<Map<String, dynamic>> _brands = [
    {
      'name': 'Fur & Co',
      'tagline': 'Your pet. Our mission.',
      'color': AppColors.primary,
      'icon': Icons.favorite,
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _slideTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      final next = (_currentSlide + 1) % _slides.length;
      _slideController.animateToPage(
        next,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _slideTimer?.cancel();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeroBanner(context),
              _buildCategoryChips(context),
              const SizedBox(height: 8),
              _buildFeaturedProducts(context),
              const SizedBox(height: 8),
              _buildPetLifeSlideshow(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ─── HERO ───────────────────────────────────────
  Widget _buildHeroBanner(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      color: const Color(0xFFF0F8FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Everything Your Pet Loves,\n',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2C2C2C),
                      height: 1.3,
                    ),
                  ),
                  TextSpan(
                    text: 'In One App',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Natural Toys  •  Healthy Food  •  Trusted Pet Care',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF555555),
                letterSpacing: 0.3,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Image.asset(
              'assets/images/home_hero_banner.png',
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  // ─── CATEGORY CHIPS ────────────────────────────
  Widget _buildCategoryChips(BuildContext context) {
    final categories = [
      {'label': 'Chew & Play', 'sub': 'Eco-Friendly', 'color': const Color(0xFF4DB6AC), 'icon': Icons.pets},
      {'label': 'Toys', 'sub': 'Fun & Active', 'color': const Color(0xFFE57373), 'icon': Icons.toys},
      {'label': 'Food', 'sub': 'Tasty & Healthy', 'color': const Color(0xFFFFB74D), 'icon': Icons.restaurant},
      {'label': 'Accessories', 'sub': 'Safe & Stylish', 'color': const Color(0xFF9575CD), 'icon': Icons.style},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.4,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final color = cat['color'] as Color;
          return Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.3), width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(cat['icon'] as IconData, color: color, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cat['label'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2C2C2C),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        cat['sub'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 10,
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ─── FEATURED PRODUCTS ─────────────────────────
  Widget _buildFeaturedProducts(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Products',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/category');
                  },
                  child: Row(
                    children: [
                      Text(
                        'View All',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(LucideIcons.arrowRight, size: 14, color: AppColors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: List.generate(_featuredProducts.length, (index) {
                final p = _featuredProducts[index];
                final brandColor = p['brand'] == 'Fur & Co'
                    ? AppColors.primary
                    : p['brand'] == 'RightforPaws'
                        ? const Color(0xFF4DB6AC)
                        : const Color(0xFF9575CD);
                return Container(
                  height: 380,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                               Image.network(
                                 p['imageUrl'] as String,
                                 fit: BoxFit.cover,
                                 errorBuilder: (_, __, ___) => Container(
                                   color: const Color(0xFFFFF8E1),
                                   child: const Icon(LucideIcons.package,
                                       color: AppColors.primary, size: 36),
                                 ),
                               ),
                               // Pet tag
                               Positioned(
                                 top: 16,
                                 right: 16,
                                 child: Container(
                                   padding: const EdgeInsets.symmetric(
                                       horizontal: 12, vertical: 6),
                                   decoration: BoxDecoration(
                                     color: Colors.black.withOpacity(0.7),
                                     borderRadius: BorderRadius.circular(20),
                                   ),
                                   child: Text(
                                     p['tag'] as String,
                                     style: const TextStyle(
                                         fontSize: 12,
                                         color: Colors.white,
                                         fontWeight: FontWeight.w600),
                                   ),
                                 ),
                               ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Brand
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: brandColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                p['brand'] as String,
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: p['brand'] == 'Fur & Co'
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              p['name'] as String,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  p['price'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                ),
                                if (p['oldPrice'] != null) ...[
                                  const SizedBox(width: 8),
                                  Text(
                                    p['oldPrice'] as String,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: AppColors.gray,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }


  // ─── PET LIFE SLIDESHOW ────────────────────────
  Widget _buildPetLifeSlideshow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A Day in the Life of Pets 🐾',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2C2C2C),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'From playtime to mealtime — every moment, curated.',
                style: GoogleFonts.lato(
                  fontSize: 13,
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: screenWidth * 1.1,
          child: PageView.builder(
            controller: _slideController,
            onPageChanged: (i) => setState(() => _currentSlide = i),
            itemCount: _slides.length,
            itemBuilder: (context, index) {
              final slide = _slides[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(slide['image']!, fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.65),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.55],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            slide['label']!,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Text(
                          slide['caption']!,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_slides.length, (i) {
            final isActive = i == _currentSlide;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
