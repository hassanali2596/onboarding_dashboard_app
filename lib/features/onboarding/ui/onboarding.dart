import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_dashboard_app/core/utils/app_navigator.dart';
import 'package:onboarding_dashboard_app/features/onboarding/ui/widgets/onboarding_card_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/assets_paths.dart';
import '../../../core/widgets/custom_button_elevated.dart';
import '../../../core/widgets/custom_status_bar.dart';
import '../data/onboarding_item_model.dart';
import '../logic/cubits/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: const _OnboardingContent(),
    );
  }
}

class _OnboardingContent extends StatefulWidget {
  const _OnboardingContent();

  @override
  State<_OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<_OnboardingContent> {
  final PageController _controller = PageController();

  final onboardingList = [
    OnboardingModel(
      title: "Welcome to Our App",
      description: "Your gateway to smart solutions.",
      imageAsset: AssetsPaths.onboardingImage1,
    ),
    OnboardingModel(
      title: "Track Your Progress",
      description: "Stay updated with real-time insights.",
      imageAsset: AssetsPaths.onboardingImage2,
    ),
    OnboardingModel(
      title: "Start Your Journey",
      description: "Let’s get you onboarded now!",
      imageAsset: AssetsPaths.onboardingImage3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final page = _controller.page ?? 0.0;
      context.read<OnboardingCubit>().updatePageOffset(page);
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
    final cubit = context.read<OnboardingCubit>();

    return CustomStatusBar(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: (theme.brightness==Brightness.light)
            ? Brightness.dark
            : Brightness.light,
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Expanded(
            child:BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return PageView.builder(
                  controller: _controller,
                  itemCount: onboardingList.length,
                  onPageChanged: (index) =>
                      cubit.updatePage(index, onboardingList.length),
                  itemBuilder: (context, index) {
                    final model = onboardingList[index];
                    final page = _controller.hasClients && _controller.page != null
                        ? _controller.page!
                        : index.toDouble();
                    final offset = index - page;
                    final animationValue = 1.0 - offset.abs().clamp(0.0, 1.0);

                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(0.0, 50 * (1 - animationValue)), // Slides up
                            child: Opacity(
                              opacity: animationValue, // Fades in
                              child: OnboardingCardItem(model: model,)
                            ),
                          ),
                          // Animate the title (slide in from bottom and fade in)
                        ],
                      ),
                    );
                  },
                );
              }
            ),
          ),
          const SizedBox(height: 24),
          SmoothPageIndicator(
            controller: _controller,
            count: onboardingList.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: state.isLastPage ? 1.0 : 0.0,
                  child:  CustomButtonElevated(
                    onPressed: state.isLastPage
                        ? () {
                      AppNavigator.pushReplacementNamed( "/login");
                    }
                        : null,
                    label: "Get Started",
                  )
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    ));
  }
}

