import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Toggle between Login and Registration
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo from mockups
              SvgPicture.asset(
                'assets/images/logo.svg',
                height: 48,
              ),
              const SizedBox(height: 32),
              
              // Animated Switcher for smooth transition between forms
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _isLogin ? _buildSignInForm(key: const ValueKey('signin')) : _buildSignUpForm(key: const ValueKey('signup')),
              ),

              const SizedBox(height: 48),
              
              // Social footer
              _buildSocialFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // SIGN IN FORM
  // -------------------------------------------------------------
  Widget _buildSignInForm({required Key key}) {
    return Container(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome Back',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 32),

          _buildGoogleButton('Continue with Google'),
          
          const SizedBox(height: 32),
          _buildDivider('OR USE YOUR EMAIL'),
          const SizedBox(height: 32),

          _buildLabel('EMAIL ADDRESS'),
          const SizedBox(height: 8),
          _buildTextField(hint: 'm@example.com'),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabel('SECRET PASSWORD'),
              Text(
                'RESET?',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildTextField(hint: '', isPassword: true),

          const SizedBox(height: 32),
          _buildSubmitButton('Sign In'),

          const SizedBox(height: 32),
          Center(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: AppColors.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  const TextSpan(text: 'New to Fur & Co? '),
                  TextSpan(
                    text: 'Create Account',
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                      decorationThickness: 2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _isLogin = false;
                        });
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // SIGN UP FORM
  // -------------------------------------------------------------
  Widget _buildSignUpForm({required Key key}) {
    return Container(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Join the Club',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 32),

          _buildGoogleButton('Sign up with Google'),
          
          const SizedBox(height: 32),
          _buildDivider('MEMBER REGISTRATION'),
          const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('FIRST NAME'),
                    const SizedBox(height: 8),
                    _buildTextField(hint: 'John'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('LAST NAME'),
                    const SizedBox(height: 8),
                    _buildTextField(hint: 'Doe'),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          _buildLabel('EMAIL'),
          const SizedBox(height: 8),
          _buildTextField(hint: 'm@example.com'),

          const SizedBox(height: 24),
          _buildLabel('PASSWORD'),
          const SizedBox(height: 8),
          _buildTextField(hint: '', isPassword: true),

          const SizedBox(height: 24),
          _buildLabel('CONFIRM'),
          const SizedBox(height: 8),
          _buildTextField(hint: '', isPassword: true),

          const SizedBox(height: 32),
          _buildSubmitButton('Create Account'),

          const SizedBox(height: 32),
          Center(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: AppColors.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  const TextSpan(text: 'Already a member? '),
                  TextSpan(
                    text: 'Sign in',
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                      decorationThickness: 2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _isLogin = true;
                        });
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // REUSABLE WIDGETS
  // -------------------------------------------------------------
  
  Widget _buildGoogleButton(String text) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {}, // Google Auth Action
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Simple Google G recreation since we don't have the asset
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(text: 'G', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF374151), // Dark gray
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(String text) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.border, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.gray.withOpacity(0.6),
              letterSpacing: 2.0,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.border, thickness: 1)),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF4B5563), // Slightly darker gray for labels
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: isPassword,
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            color: AppColors.gray.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(String text) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {}, // Form Submit
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                LucideIcons.arrowRight,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(LucideIcons.facebook),
        const SizedBox(width: 16),
        _buildSocialIcon(LucideIcons.instagram),
        const SizedBox(width: 16),
        _buildSocialIcon(LucideIcons.linkedin),
        const SizedBox(width: 16),
        _buildSocialIcon(LucideIcons.mail),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: AppColors.black,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: AppColors.primary,
          size: 20,
        ),
      ),
    );
  }
}
