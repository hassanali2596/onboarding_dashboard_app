import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomStatusBar extends StatelessWidget{
   final Widget child;
   Brightness? statusBarIconBrightness;
   Color? statusBarColor;

   CustomStatusBar({super.key,this.statusBarIconBrightness,this.statusBarColor, required this.child});
  @override
  Widget build(BuildContext context) {
    var currentTheme = Theme.of(context);
    return AnnotatedRegion(
        value:   SystemUiOverlayStyle(
        statusBarColor: statusBarColor??currentTheme.colorScheme.primary,
        statusBarIconBrightness: statusBarIconBrightness??Brightness.dark),
    child: child);
  }

}