import 'package:flutter/material.dart';

class PageTransition<T> extends PageRouteBuilder<T> {
  final Widget child;
  PageTransition({
    Key? key,
    required this.child,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return child;
          },
          transitionDuration: const Duration(milliseconds: 300),
          maintainState: true,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
