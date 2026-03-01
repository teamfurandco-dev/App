import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Shop',
            style: GoogleFonts.poppins(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          bottom: TabBar(
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.gray,
            indicatorColor: AppColors.primary,
            indicatorWeight: 3,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: AppColors.primary, width: 3),
              insets: EdgeInsets.symmetric(horizontal: 16),
            ),
            labelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            tabs: const [
              Tab(text: '🐶  Dogs'),
              Tab(text: '🐱  Cats'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _DogTab(),
            _CatTab(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SHARED DATA MODEL
// ─────────────────────────────────────────────

class _Product {
  final String name;
  final String brand;
  final String price;
  final String? oldPrice;
  final String imageUrl;
  final String category;

  const _Product({
    required this.name,
    required this.brand,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.category,
  });
}

const _brandColors = {
  'Fur & Co': AppColors.primary,
};

// ─────────────────────────────────────────────
// DOG TAB
// ─────────────────────────────────────────────

class _DogTab extends StatelessWidget {
  const _DogTab();

  static const _dogProducts = [
    _Product(
      name: 'Adjustable Dog Harness',
      brand: 'Fur & Co',
      price: '₹799',
      imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      category: 'Accessories',
    ),
    _Product(
      name: 'Coconut Rope Chew Toy',
      brand: 'Fur & Co',
      price: '₹349',
      imageUrl: 'https://images.unsplash.com/photo-1535268244668-33e7f19819acc?w=400&h=400&fit=crop',
      category: 'Toys',
    ),
    _Product(
      name: 'Daily Nutrition Dry Food',
      brand: 'Fur & Co',
      price: '₹1,299',
      oldPrice: '₹1,599',
      imageUrl: 'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=400&h=400&fit=crop',
      category: 'Food',
    ),
    _Product(
      name: 'Dental Chew Sticks',
      brand: 'Fur & Co',
      price: '₹249',
      imageUrl: 'https://images.unsplash.com/photo-1548767797-d8c844163c4c?w=400&h=400&fit=crop',
      category: 'Treats',
    ),
    _Product(
      name: 'Puppy Shampoo',
      brand: 'Fur & Co',
      price: '₹449',
      oldPrice: '₹549',
      imageUrl: 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=400&h=400&fit=crop',
      category: 'Grooming',
    ),
    _Product(
      name: 'Grain-Free Treats',
      brand: 'Fur & Co',
      price: '₹399',
      imageUrl: 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=400&h=400&fit=crop',
      category: 'Treats',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context, 'Featured Products'),
          _buildProductGrid(context, _dogProducts),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CAT TAB
// ─────────────────────────────────────────────

class _CatTab extends StatelessWidget {
  const _CatTab();

  static const _catProducts = [
    _Product(
      name: 'Feather Wand Cat Toy',
      brand: 'Fur & Co',
      price: '₹299',
      imageUrl: 'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?w=400&h=400&fit=crop',
      category: 'Toys',
    ),
    _Product(
      name: 'Scratch Board Playful',
      brand: 'Fur & Co',
      price: '₹599',
      oldPrice: '₹749',
      imageUrl: 'https://images.unsplash.com/photo-1511044568932-338ceba04987?w=400&h=400&fit=crop',
      category: 'Toys',
    ),
    _Product(
      name: 'Premium Wet Cat Food',
      brand: 'Fur & Co',
      price: '₹899',
      imageUrl: 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=400&h=400&fit=crop',
      category: 'Food',
    ),
    _Product(
      name: 'Cat Collar with Bell',
      brand: 'Fur & Co',
      price: '₹199',
      imageUrl: 'https://images.unsplash.com/photo-1472491235688-bdc81a63246e?w=400&h=400&fit=crop',
      category: 'Accessories',
    ),
    _Product(
      name: 'Kitten Dry Food',
      brand: 'Fur & Co',
      price: '₹999',
      oldPrice: '₹1,199',
      imageUrl: 'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?w=400&h=400&fit=crop',
      category: 'Food',
    ),
    _Product(
      name: 'Catnip Toys Pack',
      brand: 'Fur & Co',
      price: '₹349',
      imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400&h=400&fit=crop',
      category: 'Toys',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context, 'Featured Products'),
          _buildProductGrid(context, _catProducts),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SHARED WIDGETS
// ─────────────────────────────────────────────

Widget _buildSectionHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
    child: Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    ),
  );
}

Widget _buildProductGrid(BuildContext context, List<_Product> products) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 12),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.72,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) => _ProductCard(product: products[index]),
  );
}

class _ProductCard extends StatelessWidget {
  final _Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final brandColor = _brandColors[product.brand] ?? AppColors.primary;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
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
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFFFF8E1),
                      child: const Icon(LucideIcons.package,
                          color: AppColors.primary, size: 40),
                    ),
                  ),
                  // Brand badge
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: brandColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        product.brand,
                        style: GoogleFonts.poppins(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: product.brand == 'Fur & Co'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Details
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      product.price,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    if (product.oldPrice != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        product.oldPrice!,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: AppColors.gray,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
