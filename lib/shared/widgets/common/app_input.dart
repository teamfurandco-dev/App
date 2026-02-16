import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const AppInput({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: GoogleFonts.lato(
            fontSize: 14,
            color: AppColors.black,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.lato(
              fontSize: 14,
              color: AppColors.gray, // muted-foreground
            ),
            errorText: errorText,
            filled: true,
            fillColor: AppColors.white, // background
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), // h-10 py-2
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6), // rounded-md
              borderSide: const BorderSide(color: AppColors.border), // border-input
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.black, width: 1.5), // ring-offset-background focus-visible:ring-2
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }
}
