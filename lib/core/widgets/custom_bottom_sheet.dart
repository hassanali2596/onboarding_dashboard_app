import 'package:flutter/material.dart';
import 'package:onboarding_dashboard_app/core/utils/app_navigator.dart';

class CustomAnimatedBottomSheet extends StatefulWidget {
  final String title;
  final Widget child;
  final double? height; // Set a default height for the bottom sheet
  const CustomAnimatedBottomSheet({super.key, required this.title, this.height, required this.child});

  @override
  State<CustomAnimatedBottomSheet> createState() => _CustomAnimatedBottomSheetState();
}

class _CustomAnimatedBottomSheetState extends State<CustomAnimatedBottomSheet> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        height: widget.height,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              exitCircleIcon(
                iconColor: Colors.grey,
                theme: theme
              ),
              const Spacer(),
              Text(widget.title, style: theme.textTheme.titleLarge),
              const Spacer(),
              const SizedBox(width: 17,)
            ],),
            const SizedBox(height: 16),
            widget.child,
          ],
        ),
      ),
    ));
  }
  Widget exitCircleIcon({Color? iconColor,double? size,double? circleRadius,double? radiusWidth,required ThemeData theme}) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pop(context);
      },
      child: CircleAvatar(
        radius: circleRadius?? 13.5,
        backgroundColor: iconColor,
        child: CircleAvatar(
          radius: circleRadius!=null? circleRadius-(radiusWidth??1.5):12,
          backgroundColor: theme.cardColor,
          child: Icon(Icons.close,color: iconColor,size: size??16),
        ),
      ),
    );
  }
}

