import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyNavigation {
  static pushNavigation(BuildContext context, Widget child) {
    Navigator.push(
        context, PageTransition(child: child, type: PageTransitionType.fade));
  }
}
