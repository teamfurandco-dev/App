import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CareCategories extends StatelessWidget {
  const CareCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'id': 'dog-nutrition',
        'title': 'Nutrition for Dogs',
        'description': 'Science-backed recipes for vitality.',
        'image': 'assets/images/dog_eating.png',
        'link': '/products?category=dog-nutrition'
      },
      {
        'id': 'cat-nutrition',
        'title': 'Nutrition for Cats',
        'description': 'Clean protein for the pickiest eaters.',
        'image': 'assets/images/cat_eating.png',
        'link': '/products?category=cat-nutrition'
      },
      {
        'id': 'comfort-play',
        'title': 'Comfort & Play',
        'description': 'Enrichment tools for modern homes.',
        'image': 'assets/images/dog_cat_playing.png',
        'link': '/products?category=comfort'
      }
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Browse by Category',
                        style: GoogleFonts.poppins(
                          fontSize: 24, // 3xl/4xl
                          fontWeight: FontWeight.w500, // medium
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Everything your pet needs, thoughtfully organized.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/products'),
                   style: TextButton.styleFrom(
                   padding: EdgeInsets.zero,
                   minimumSize: Size.zero,
                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                 ),
                  child: Row(
                    children: [
                      Text(
                        'View All',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 4),
                      const Icon(LucideIcons.arrowRight, size: 16, color: AppColors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Horizontal List
          SizedBox(
            height: 250, // Aspect ratio [4/3] + content
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return GestureDetector(
                  onTap: () => context.go(cat['link'] as String),
                  child: Container(
                    width: 280, // w-[85vw] approx on mobile
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32), // rounded-[2rem]
                      color: Colors.grey[200], // Placeholder bg
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Background Image
                        Image.asset(
                          cat['image'] as String,
                          fit: BoxFit.cover,
                        ),
                        // Overlays
                        Container(color: Colors.black.withOpacity(0.2)),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.transparent,
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.6, 1.0],
                            ),
                          ),
                        ),
                        
                        // Content
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cat['title'] as String,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                cat['description'] as String,
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Explore Link
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: AppColors.primary, width: 1),
                                  ),
                                ),
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Text(
                                  'EXPLORE',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    color: AppColors.primary, // Furco Yellow
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
