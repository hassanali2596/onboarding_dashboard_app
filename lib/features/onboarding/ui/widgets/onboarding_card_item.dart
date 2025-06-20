import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/onboarding_item_model.dart';

class OnboardingCardItem extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingCardItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SvgPicture.asset(
            model.imageAsset,
            height: 250,
          ),
          const SizedBox(height: 32),
          Text(
            model.title,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            model.description,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],),
      ),
    );
  }
}
