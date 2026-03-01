import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.bookOpen, size: 64, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Blog',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Coming soon...',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
