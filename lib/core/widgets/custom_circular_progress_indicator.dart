import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CircularProgressIndicator(
      color: theme.primaryColor,
    );
  }
}
