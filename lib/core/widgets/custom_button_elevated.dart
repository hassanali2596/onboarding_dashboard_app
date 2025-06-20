import 'dart:ui';

import 'package:flutter/material.dart';

class CustomButtonElevated extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? color;
  final double? width;
  final double? height;

  const CustomButtonElevated({super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.width ,
    this.height ,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color?? theme.primaryColor,
        minimumSize: Size(width??200, height??50),
      ),
      child: Text(label,
        style: TextStyle(
          color: theme.colorScheme.onPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


}