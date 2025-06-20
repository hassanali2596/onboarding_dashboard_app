import 'package:flutter/material.dart';

import '../../main.dart';


abstract class AppNavigator {
  static Future<void> push(BuildContext context, Widget target) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: target.toStringShort()),
        builder: (_) => target,
      ),
    );
  }

  static Future<void> pushReplacement(BuildContext context, Widget target) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: target.toStringShort()),
        builder: (_) => target,
      ),
    );
  }
  static Future<T?> pushReplacementNamed<T extends Object, TO extends Object>(
      String routeName,
      {Object? args}) async {
    return navigatorKey.currentState?.pushReplacementNamed<T, TO>(
      routeName,
      arguments: args,
    );
  }

  static void pop(context) {
    Navigator.pop(context);
  }

  //* can pop
  static bool popUntil(context) {
    return Navigator.canPop(context);
  }

  static Future<void> pushAndRemoveUntil(BuildContext context, Widget target) async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) {
          return target;
        },
      ),
      (Route<dynamic> route) => false,
    );
  }

  static Future? pushNewScreen( Widget widget)  {
    if (getCurrentRouteName()!=("SplashScreen")) {
      pushReplacement(navigatorKey.currentContext!, widget);
    }
    else if (hasRoutesInStack()) {
      return navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) => widget),
      );
    }
    else{
      pushAndRemoveUntil2(widget);
    }
    return null;
  }
  static Future? pushAndRemoveUntil2(Widget widget) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  static bool hasRoutesInStack() {
    final navigator = navigatorKey.currentState;
    if (navigator == null) return false;
    return navigator.canPop();
  }
  static String getCurrentRouteName(){
    return ModalRoute.of(navigatorKey.currentContext!)?.settings.name??"";
  }
}
