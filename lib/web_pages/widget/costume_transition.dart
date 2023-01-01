

import 'package:flutter/material.dart';

class CostumeTransition extends PageRouteBuilder {
  final Widget child;

  CostumeTransition({
    required this.child,
    RouteSettings? settings,
    
  }) : super(
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(milliseconds: 700),
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final curvedAnimation =
        CurvedAnimation(parent: animation, curve: Interval(0, 0.5));
    return FadeTransition(opacity: curvedAnimation, child: child);
  }
}
