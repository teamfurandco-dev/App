import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/common/app_button.dart';
import '../../../shared/widgets/common/app_product_card.dart';
import '../../home/presentation/widgets/care_categories.dart';
import '../../home/presentation/widgets/philosophy_strip.dart';
import '../../home/presentation/widgets/why_choose.dart';
import '../../home/presentation/widgets/story_reuse.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Static Hero Image with Art Direction
    // 2. Gradient Overlay
    // 3. Content
    
    // Using LayoutBuilder to handle responsive behavior if needed, 
    // but focusing on Mobile view as per instructions.
    
    return Scaffold(
      extendBodyBehindAppBar: true, 
      
      body: SingleChildScrollView(
        child: Column(

          children: [
            _buildHeroSection(context),
            const CareCategories(),
            const PhilosophyStrip(),
            _buildCuratedEssentials(context),
            const StoryReuse(),
            const WhyChoose(),
          ],
        ),
      ),
    );
  }

  // ... _buildHeroSection ...

  Widget _buildCuratedEssentials(BuildContext context) {
    // Dummy Data mimicking the webapp
    final products = [
      {
        'id': '1',
        'name': 'The Daily',
        'price': '\$39.00',
        'image': 'https://images.unsplash.com/photo-1548767797-d8c844163c4c?q=80&w=2670&auto=format&fit=crop', // Dog image placeholder
        'category': 'Nutrition',
        'rating': 4.9,
      },
      {
        'id': '2',
        'name': 'Calming Chews',
        'price': '\$24.00',
        'oldPrice': '\$30.00',
        'image': 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?q=80&w=2688&auto=format&fit=crop', // Dog 2
        'category': 'Wellness',
        'rating': 4.8,
        'isFeatured': true,
      },
      {
        'id': '3',
        'name': 'Silky Fur Oil',
        'price': '\$28.00',
        'image': 'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?q=80&w=2594&auto=format&fit=crop', // Dog 3
        'category': 'Grooming',
        'rating': 5.0,
      },
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
                       'Everyday Essentials',
                       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     const SizedBox(height: 4),
                     Text(
                       'Carefully chosen tools for a happier life.',
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
          const SizedBox(height: 16),
          
          // Horizontal Product List
          SizedBox(
            height: 250, // Card height + padding
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return AppProductCard(
                  id: product['id'] as String,
                  // Use CachedNetworkImage for remote images, assuming we don't have local assets for products yet
                  imageUrl: product['image'] as String, 
                  name: product['name'] as String,
                  price: product['price'] as String,
                  oldPrice: product['oldPrice'] as String?,
                  rating: product['rating'] as double?,
                  category: product['category'] as String,
                  isFeatured: product['isFeatured'] as bool? ?? false,
                  onTap: () => context.go('/products/${product['id']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHeroSection(BuildContext context) {
    // Height calculation mimics min-h-[calc(100vh-80px-5vh)]
    // Roughly 85-90% of screen height minus header. 
    // Let's go with a fixed high height for mobile or aspect ratio.
    final screenHeight = MediaQuery.of(context).size.height;
    final heroHeight = screenHeight * 0.85;

    return SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background Image
          Image.asset(
            'assets/images/hero.png',
            fit: BoxFit.cover,
            alignment: const Alignment(0.4, 0.0), // object-[70%_center] approx
          ),

          // 2. Gradient Overlay
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
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          
          // 3. Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // text-center on mobile
              children: [
                const Spacer(),
                Text(
                  'Curated Care for',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Your Best Friend.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    fontSize: 32, // Custom size to match visual hierarchy
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Science-backed nutrition and thoughtfully designed essentials for the ones who trust you the most.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                
                // Custom White Button for Hero
                SizedBox(
                  width: double.infinity,
                   child: ElevatedButton(
                    onPressed: () => context.go('/products'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 10,
                      shadowColor: Colors.white.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Explore Essentials',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(LucideIcons.arrowRight, size: 20, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
