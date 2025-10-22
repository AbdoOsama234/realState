// animate_route.dart
import 'package:flutter/material.dart';

Route<T> createSlideUpRoute<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 380),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // من أسفل لأعلى
      const end = Offset.zero;
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOutCubic));
      return SlideTransition(position: curved.drive(tween), child: child);
    },
  );
}
