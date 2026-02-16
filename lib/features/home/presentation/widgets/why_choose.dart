import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class WhyChoose extends StatelessWidget {
  const WhyChoose({super.key});

  @override
  Widget build(BuildContext context) {
    final reasons = [
      {'icon': LucideIcons.heart, 'label': 'Loved by Pet Parents'},
      {'icon': LucideIcons.shieldCheck, 'label': 'Vet Approved'},
      {'icon': LucideIcons.leaf, 'label': 'Safe Ingredients'}, // replaced sparkles/leaf logic if needed, keeping leaf/sparkles consistency? code used sparkles.
      {'icon': LucideIcons.pencil, 'label': 'Thoughtfully Designed'},
    ];

    return Container(
      color: const Color(0xFFFDFBF7),
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  'Why Choose Fur & Co?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Trusted by thousands of pet parents across India.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.gray,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          
          // Grid Layout for reasons
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),
            itemCount: reasons.length,
            itemBuilder: (context, index) {
              final item = reasons[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black.withOpacity(0.05)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 32,
                      color: AppColors.gold,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item['label'] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
