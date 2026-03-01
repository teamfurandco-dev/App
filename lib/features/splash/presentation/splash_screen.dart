import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Timer(const Duration(seconds: 3), () async {
      if (!mounted) return;
      final prefs = await SharedPreferences.getInstance();
      final locationShown = prefs.getBool('location_permission_shown') ?? false;

      if (mounted) {
        if (!locationShown) {
          context.go('/location-permission');
        } else {
          context.go('/');
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(color: Colors.white),

          // Top yellow curved shape
          Positioned(
            top: -size.height * 0.05,
            left: -size.width * 0.15,
            child: Container(
              width: size.width * 0.85,
              height: size.height * 0.42,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(size.width * 0.6),
                ),
              ),
            ),
          ),

          // Bottom yellow curved shape
          Positioned(
            bottom: -size.height * 0.05,
            right: -size.width * 0.15,
            child: Container(
              width: size.width * 0.85,
              height: size.height * 0.38,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.6),
                ),
              ),
            ),
          ),

          // Top area pet bubbles
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.06,
            child: _buildPetBubble('assets/images/splash_dog1.jpg', size.width * 0.22),
          ),
          Positioned(
            top: size.height * 0.13,
            left: size.width * 0.3,
            child: _buildPetBubble('assets/images/splash_cat1.jpg', size.width * 0.18),
          ),
          Positioned(
            top: size.height * 0.02,
            right: size.width * 0.06,
            child: _buildPetBubble('assets/images/splash_dog2.jpg', size.width * 0.2),
          ),

          // Bottom area pet bubbles
          Positioned(
            bottom: size.height * 0.06,
            left: size.width * 0.04,
            child: _buildPetBubble('assets/images/splash_cat2.jpg', size.width * 0.2),
          ),
          Positioned(
            bottom: size.height * 0.14,
            left: size.width * 0.27,
            child: _buildPetBubble('assets/images/splash_dog3.jpg', size.width * 0.18),
          ),
          Positioned(
            bottom: size.height * 0.05,
            right: size.width * 0.06,
            child: _buildPetBubble('assets/images/splash_cat3.jpg', size.width * 0.22),
          ),


          // Center content - Logo and tagline
          Center(
            child: FadeTransition(
              opacity: _fadeIn,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 50,
                  ),
                  const SizedBox(height: 16),
                  // Tagline
                  const Text(
                    'Where Pets Rule & Tails Wag',
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPetBubble(String imagePath, double size, {bool isNetwork = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipOval(
        child: isNetwork 
            ? Image.network(imagePath, fit: BoxFit.cover)
            : Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
