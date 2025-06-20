import 'package:flutter/material.dart';

import '../../core/utils/app_navigator.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => AppNavigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child:  Icon(
            Icons.arrow_back_ios,
            color:theme.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
