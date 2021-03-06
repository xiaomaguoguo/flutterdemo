import 'package:flutter/material.dart';

class ScaleRoute extends PageRouteBuilder {
  final Widget widget;
  ScaleRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new ScaleTransition(
            scale: new Tween<double>(
              begin: 0.5,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.1,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.5,
                    1.0,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: child,
            ),
          );
        });
}
