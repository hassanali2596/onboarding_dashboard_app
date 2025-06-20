import 'package:flutter/material.dart';

class CustomFormFieldLabel extends StatelessWidget {
  final String labelText;
  const CustomFormFieldLabel({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(labelText, style: theme.textTheme.labelLarge);
  }
}
