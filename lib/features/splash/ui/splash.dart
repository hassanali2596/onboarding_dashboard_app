import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_dashboard_app/core/utils/app_navigator.dart';

import '../../../core/constants/assets_paths.dart';
import '../../../core/widgets/custom_status_bar.dart';
import '../../onboarding/ui/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Delay animation until after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();

      // Delay navigation to allow animation to play
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          AppNavigator.pushReplacement(context, const OnboardingScreen());
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomStatusBar(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
      theme.brightness == Brightness.light ? Brightness.dark : Brightness.light,
      child: Scaffold(
        body: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Image.asset(
              AssetsPaths.logo,
              height: 120,
            ),
          ),
        ),
      ),
    );
  }
}
