import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppButtonVariant { primary, secondary, outline, ghost, link }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool fullWidth;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.fullWidth = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Base Styles
    Color backgroundColor;
    Color foregroundColor;
    BorderSide? borderSide;
    double? elevation = 0;

    switch (variant) {
      case AppButtonVariant.primary:
        backgroundColor = AppColors.primary;
        foregroundColor = AppColors.black;
        break;
      case AppButtonVariant.secondary:
        backgroundColor = AppColors.beige; // or cream/gold light as secondary?
        // Checking index.css: --secondary: 40 100% 97% -> #FFF7E0 (very light yellow/cream)
        // --secondary-foreground: 222.2 47.4% 11.2% -> #0F172A (dark blue/black)
        backgroundColor = const Color(0xFFFFF7E0); 
        foregroundColor = AppColors.black;
        break;
      case AppButtonVariant.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = AppColors.black;
        borderSide = const BorderSide(color: AppColors.border);
        break;
      case AppButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = AppColors.black;
        break;
      case AppButtonVariant.link:
        backgroundColor = Colors.transparent;
        foregroundColor = AppColors.primary; // Or black with underline?
        // text-primary underline-offset-4 hover:underline
        break;
    }

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (icon != null && !isLoading) ...[
          Icon(icon, size: 18, color: foregroundColor),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
            decoration: variant == AppButtonVariant.link
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ],
    );

    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // --radius: 0.5rem (8px)
        side: borderSide ?? BorderSide.none,
      ),
      minimumSize: fullWidth ? const Size(double.infinity, 48) : null,
    );

    if (variant == AppButtonVariant.link || variant == AppButtonVariant.ghost) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: content,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: content,
    );
  }
}
