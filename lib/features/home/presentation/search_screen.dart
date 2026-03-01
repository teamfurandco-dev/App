import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) context.go('/');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Search header
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF0F0F0), width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go('/'),
                      child: const Icon(LucideIcons.arrowLeft, color: AppColors.black, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const Icon(LucideIcons.search, color: AppColors.gray, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                focusNode: _focusNode,
                                decoration: const InputDecoration(
                                  hintText: 'Search for products, brands...',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                                ),
                                style: const TextStyle(fontSize: 15, color: AppColors.black),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            if (_controller.text.isNotEmpty)
                              GestureDetector(
                                onTap: () {
                                  _controller.clear();
                                  setState(() {});
                                },
                                child: const Icon(LucideIcons.x, color: AppColors.gray, size: 16),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Body content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trending section
                      Row(
                        children: [
                          Icon(LucideIcons.trendingUp, color: AppColors.primary, size: 18),
                          const SizedBox(width: 8),
                          const Text(
                            'Trending Searches',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 10,
                        children: [
                          _buildChip('Dog Food', LucideIcons.flame),
                          _buildChip('Cat Toys', LucideIcons.flame),
                          _buildChip('Grooming Kit', LucideIcons.flame),
                          _buildChip('Organic Treats', LucideIcons.flame),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Browse by category
                      const Text(
                        'Browse by Category',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildCategoryRow(
                        icon: Icons.pets,
                        title: 'Dogs',
                        subtitle: 'Food, treats, toys & more',
                      ),
                      _buildCategoryRow(
                        icon: Icons.pets,
                        title: 'Cats',
                        subtitle: 'Food, litter, toys & more',
                      ),
                      _buildCategoryRow(
                        icon: LucideIcons.sparkles,
                        title: 'Grooming',
                        subtitle: 'Shampoo, brushes & care',
                      ),
                      _buildCategoryRow(
                        icon: LucideIcons.heart,
                        title: 'Health & Wellness',
                        subtitle: 'Supplements & vet essentials',
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
          ),
        ),
        trailing: const Icon(LucideIcons.chevronRight, color: AppColors.gray, size: 18),
        onTap: () => context.go('/category'),
      ),
    );
  }
}
