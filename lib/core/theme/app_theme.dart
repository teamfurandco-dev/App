import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white, // Most pages use white or cream
      
      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.gold,
        surface: AppColors.white,
        error: AppColors.error,
        onPrimary: AppColors.black,
        onSecondary: AppColors.black,
        onSurface: AppColors.black,
        onError: Colors.white,
      ),

      // Text Theme
      textTheme: TextTheme(
        // Headings (Peace Sans -> Poppins)
        displayLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        displayMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        displaySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        
        // Titles
        titleLarge: GoogleFonts.poppins( // Peace Sans
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        titleMedium: GoogleFonts.playfairDisplay( // Serif uses
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        titleSmall: GoogleFonts.lato( // Body uses
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        
        // Body (Lato)
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          color: AppColors.black,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          color: AppColors.black,
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 12,
          color: AppColors.gray,
        ),
        
        // Button text
        labelLarge: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      
      // Components Styling
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
