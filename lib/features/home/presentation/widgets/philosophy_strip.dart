import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class PhilosophyStrip extends StatelessWidget {
  const PhilosophyStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final values = [
      {'icon': LucideIcons.shieldCheck, 'label': 'Vet Approved'},
      {'icon': LucideIcons.leaf, 'label': 'Limited Ingredients'},
      {'icon': LucideIcons.globe, 'label': 'Ethically Sourced'},
      {'icon': LucideIcons.home, 'label': 'Designed for Indian Homes'},
    ];

    // Mobile adaptation: Instead of auto-scroll ticker which can be janky without heavy packages,
    // we'll use a clean horizontal list view which is more native-feeling on mobile.
    
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  height: 1.2,
                ),
                children: [
                  const TextSpan(text: 'The Science of\n'),
                  TextSpan(
                    text: 'Happy Pets',
                    style: GoogleFonts.playfairDisplay(
                      fontStyle: FontStyle.italic,
                      color: AppColors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 140,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: values.length,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                final item = values[index];
                return Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF8F5),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: Center(
                        child: Icon(
                          item['icon'] as IconData,
                          size: 32,
                          color: AppColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 100,
                      child: Text(
                        item['label'] as String,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
