import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/theme/app_colors.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  Future<void> _handleAllow(BuildContext context) async {
    // Request location permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Mark as shown regardless of result
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('location_permission_shown', true);

    if (context.mounted) {
      context.go('/');
    }
  }

  Future<void> _handleSkip(BuildContext context) async {
    // Mark as shown so it won't appear again
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('location_permission_shown', true);

    if (context.mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Location icon with yellow circle
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.cream,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_on_rounded,
                    size: 60,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                'Enable Location',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 16),

              // Description
              const Text(
                'Allow Fur & Co to access your location to find\nnearby stores, delivery availability, and\npersonalized offers in your area.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const Spacer(flex: 2),

              // Allow button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _handleAllow(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Allow Location Access',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Skip button
              TextButton(
                onPressed: () => _handleSkip(context),
                child: const Text(
                  'Maybe Later',
                  style: TextStyle(
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
